FactoryGirl.define do
  factory :proposal do
    start_date "2017-08-06"
    end_date "2017-08-07"
    total_amount "9.99"
    total_guests 1
    extra_info "MyText"
    property
    user
  end
end
