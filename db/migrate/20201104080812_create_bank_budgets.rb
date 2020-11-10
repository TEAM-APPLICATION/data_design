class CreateBankBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_budgets do |t|
      t.string :work_program_group
      t.string :work_program
      t.string :unit
      t.integer :fiscal_year
      t.decimal :bank_budget, precision: 14, scale: 4
      t.decimal :all_funds, precision: 14, scale: 4
      t.string :notes

      t.timestamps
    end
  end
end
