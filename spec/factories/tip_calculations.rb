FactoryBot.define do
  factory :tip_calculation do
    bill_amount { Faker::Commerce.price(range: 10.0..100.0, as_string: false) }
    tip_percentage { [10, 15, 20].sample }
    tip_amount { (bill_amount * (tip_percentage / 100.0)).round(2) }
    total_bill { (bill_amount + tip_amount).round(2) }
    number_of_people { Faker::Number.between(from: 1, to: 10) }
    per_person_amount { (total_bill / number_of_people).round(2) }
    created_at { Faker::Time.between(from: 1.month.ago, to: Time.now) }
    updated_at { created_at }
  end
end
