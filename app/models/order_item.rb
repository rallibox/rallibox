class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :ordered_item, polymorphic: true
end
