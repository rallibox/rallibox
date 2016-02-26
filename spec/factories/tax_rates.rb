FactoryGirl.define do
  factory :tax_rate do
    name "MyString"
    rate "9.99"
    country_ids "MyText"
    address_type "MyString"
  end
end
