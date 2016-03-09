FactoryGirl.define do
  factory :address do
    customer nil
    address_type "MyString"
    default false
    address_one "MyString"
    address_two "MyString"
    city "MyString"
    state "MyString"
    postcode "MyString"
  end
end
