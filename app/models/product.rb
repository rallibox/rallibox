class Product < ActiveRecord::Base
  belongs_to :parent
  belongs_to :tax_rate
end
