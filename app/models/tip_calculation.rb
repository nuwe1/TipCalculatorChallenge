class TipCalculation < ApplicationRecord
    # Ensure presence of required fields
    validates :bill_amount, :tip_percentage, :tip_amount,
              :total_bill, :number_of_people, :per_person_amount, presence: true

    # Validate numericality and ensure they are greater than 0
    validates :bill_amount, :tip_percentage, :number_of_people, numericality: { greater_than: 0 }
  end
