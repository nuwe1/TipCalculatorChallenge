# spec/models/tip_calculation_spec.rb
require 'rails_helper'

RSpec.describe TipCalculation, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:bill_amount) }
    it { should validate_presence_of(:tip_percentage) }
    it { should validate_presence_of(:number_of_people) }
    it { should validate_presence_of(:tip_amount) }
    it { should validate_presence_of(:total_bill) }
    it { should validate_presence_of(:per_person_amount) }

    it { should validate_numericality_of(:bill_amount).is_greater_than(0) }
    it { should validate_numericality_of(:tip_percentage).is_greater_than(0) }
    it { should validate_numericality_of(:number_of_people).is_greater_than(0) }

    it { should validate_numericality_of(:tip_amount).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:total_bill).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:per_person_amount).is_greater_than_or_equal_to(0) }
  end
end
