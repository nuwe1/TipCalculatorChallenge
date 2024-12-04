class CreateTipCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :tip_calculations do |t|
      t.decimal :bill_amount, precision: 10, scale: 2
      t.integer :tip_percentage
      t.decimal :tip_amount, precision: 10, scale: 2
      t.decimal :total_bill, precision: 10, scale: 2
      t.integer :number_of_people
      t.decimal :per_person_amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
