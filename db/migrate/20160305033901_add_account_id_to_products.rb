class AddAccountIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :account, index: true, foreign_key: true
  end
end
