class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.references :ordered_item, polymorphic: true, index: true
      t.integer :quantity, default: 1
      t.decimal :unit_price,        precision: 8, scale: 2
      t.decimal :unit_cost_price,        precision: 8, scale: 2
      t.decimal :tax_amount,        precision: 8, scale: 2
      t.decimal :tax_rate,        precision: 8, scale: 2
      t.decimal :weight,        precision: 8, scale: 3

      t.timestamps null: false
    end
  end
end
