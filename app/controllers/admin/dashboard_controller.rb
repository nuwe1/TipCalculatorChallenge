# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    # Use a before_action to find the calculation before the specified actions
    before_action :set_tip_calculation, only: [:show, :edit, :update, :destroy]

    def index
      # Fetch all tip calculations and order them by created_at in descending order
      @calculations = TipCalculation.order(created_at: :desc)
    end

    def show
      # Fetch a specific tip calculation by its ID
      @calculation = TipCalculation.find(params[:id])
    end

    def edit
      # Fetch a specific tip calculation by its ID for editing
      @calculation = TipCalculation.find(params[:id])
    end

    def update
      if @calculation.update(tip_calculation_params)
        flash[:success] = "The tip calculation has been updated."
        redirect_to admin_tips_path
      else
        flash.now[:error] = "There was an error updating the tip calculation."
        render :edit
      end
    end

    def destroy
      @calculation.destroy
      flash[:success] = "The tip calculation has been deleted."
      redirect_to admin_tips_path
    end

    private

    # Set the tip calculation for show, edit, update, and destroy actions
    def set_tip_calculation
      @calculation = TipCalculation.find_by(id: params[:id])
      unless @calculation
        flash[:error] = "Tip calculation not found."
        redirect_to admin_tips_path
      end
    end

    # Permit the relevant parameters for the tip calculation
    def tip_calculation_params
      params.require(:tip_calculation).permit(:bill_amount, :tip_percentage, :tip_amount, :total_bill, :number_of_people, :per_person_amount)
    end
  end
end
