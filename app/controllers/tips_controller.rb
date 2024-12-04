class TipsController < ApplicationController
    def index
      # Render the tip calculator form
    end

    def calculate
      logger.debug "Params received: #{params.inspect}"

      # Retrieve and cast the parameters using strong parameters
      tip_data = tip_params
      bill_amount = tip_data[:bill_amount].to_f
      tip_percentage = tip_data[:tip_percentage].to_i
      custom_tip_percentage = tip_data[:custom_tip_percentage].to_i
      number_of_people = tip_data[:number_of_people].to_i

      # Initialize an errors hash to store individual error messages
      errors = {}

      # Validate inputs and add specific error messages
      errors[:bill_amount] = "Can't be zero." if bill_amount <= 0
      errors[:tip_percentage] = "Can't be zero." if tip_percentage <= 0 && custom_tip_percentage <= 0
      errors[:number_of_people] = "Can't be zero." if number_of_people <= 0

      # If there are errors, render the index page with error messages
      if errors.any?
        flash.now[:errors] = errors
        return redirect_to root_path, flash.now[:errors]
      end

      # Perform the calculation
      tip_percentage_to_use = tip_percentage.positive? ? tip_percentage : custom_tip_percentage
      tip_amount = bill_amount * (tip_percentage_to_use / 100.0)
      total_bill = bill_amount + tip_amount
      per_person_amount = number_of_people.positive? ? (total_bill / number_of_people) : total_bill

      # Save the calculation to the database
      TipCalculation.create!(
        bill_amount: bill_amount,
        tip_percentage: tip_percentage_to_use,
        tip_amount: tip_amount,
        total_bill: total_bill,
        number_of_people: number_of_people,
        per_person_amount: per_person_amount
      )

      # Redirect to root with a success message
      redirect_to root_path, notice: "Calculation complete and saved successfully! Click this notification to refresh the page."
    rescue ActiveRecord::RecordInvalid => e
      logger.error "Error saving calculation: #{e.message}"
      flash.now[:error] = "Something went wrong. Please try again."
      return redirect_to root_path
    end

    private

    def tip_params
      # Ensure the parameters are correctly permitted under the 'tip' key
      params.permit(:bill_amount, :tip_percentage, :custom_tip_percentage, :number_of_people)
    end
  end
