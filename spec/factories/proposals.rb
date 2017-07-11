FactoryGirl.define do
  factory :proposal do
    start_date "2017-07-07"
    end_date "2017-07-07"
    total_amount "9.99"
    total_guests 1
    rent_purpose "MyString"
    name "MyString"
    email "MyString"
    cpf "MyString"
    phone "MyString"
    extra_info "MyText"
    property
  end
end
