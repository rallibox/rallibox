class RenameColumnIsSaleRepInUsersToIsSalesRep < ActiveRecord::Migration
  def change
    rename_column :users, :is_sale_rep, :is_sales_rep
    
  end
end
