class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.float :initial_amount, default: 0.0

      t.timestamps
    end
  end
end
