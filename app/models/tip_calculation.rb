class TipCalculation < ApplicationRecord
  # Ensure presence of required fields
  validates :bill_amount, :tip_percentage, :tip_amount,
            :total_bill, :number_of_people, :per_person_amount, presence: true

  # Validate numericality and ensure they are greater than 0
  validates :bill_amount, :tip_percentage, :number_of_people, numericality: { greater_than: 0 }

  # Validate numericality for fields like tip_amount, total_bill, and per_person_amount, if needed
  validates :tip_amount, :total_bill, :per_person_amount, numericality: { greater_than_or_equal_to: 0 }
end
