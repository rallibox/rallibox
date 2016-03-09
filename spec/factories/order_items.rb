FactoryGirl.define do
  factory :order_item do
    order nil
    ordered_item nil
    quantity 1
    unit_price "9.99"
    unit_cost_price "9.99"
    tax_amount "9.99"
    tax_rate "9.99"
    weight "9.99"
  end
end
