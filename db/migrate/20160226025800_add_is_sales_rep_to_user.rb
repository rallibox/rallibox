class AddIsSalesRepToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_sale_rep, :boolean
  end
end
