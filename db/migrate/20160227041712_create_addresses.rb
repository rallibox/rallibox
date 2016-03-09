class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :customer, index: true, foreign_key: true
      t.string :address_type
      t.boolean :default
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :postcode

      t.timestamps null: false
    end
  end
end
