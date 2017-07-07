FactoryGirl.define do
  factory :property do
    maximum_guests 1
    minimum_rent 1
    maximum_rent 1
    daily_rate "9.99"
    property_type "MyString"
    rent_purpose "MyString"
    property_location "MyString"
    description "MyText"
  end
end
