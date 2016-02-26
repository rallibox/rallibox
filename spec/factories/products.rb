FactoryGirl.define do
  factory :product do
    parent nil
    name "MyString"
    sku "MyString"
    permalink "MyString"
    description "MyText"
    short_description "MyText"
    active false
    weight "9.99"
    price "9.99"
    cost_price "9.99"
    tax_rate nil
    featured false
    in_the_box "MyText"
    stock_control false
    default false
  end
end
