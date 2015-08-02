class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total_price
      t.datetime :completed_date
      t.string :state, null: false, default: 'in_progress'

      t.timestamps null: false
    end
  end
end
