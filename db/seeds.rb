# frozen_string_literal: true

require 'faker'

puts "Seeding Tip Calculations..."

10.times do
  bill_amount = Faker::Commerce.price(range: 10.0..100.0, as_string: false)
  tip_percentage = [10, 15, 20].sample
  tip_amount = (bill_amount * (tip_percentage / 100.0)).round(2)
  total_bill = (bill_amount + tip_amount).round(2)
  number_of_people = Faker::Number.between(from: 1, to: 10)
  per_person_amount = (total_bill / number_of_people).round(2)

  TipCalculation.create!(
    bill_amount: bill_amount,
    tip_percentage: tip_percentage,
    tip_amount: tip_amount,
    total_bill: total_bill,
    number_of_people: number_of_people,
    per_person_amount: per_person_amount,
    created_at: Faker::Time.between(from: 1.month.ago, to: Time.now),
    updated_at: Faker::Time.between(from: 1.month.ago, to: Time.now)
  )
end

puts "Seeding completed!"
