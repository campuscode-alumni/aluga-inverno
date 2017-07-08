FactoryGirl.define do
  factory :property do
    maximum_guests 10
    minimum_rent 10
    maximum_rent 100
    daily_rate "9.99"
    property_type "Casa"
    rent_purpose "Festas"
    property_location "Sao Paulo"
    description "Propiedade para aluguel na praia"
    picture "Sem foto "
    owner "Owner"
    email "Email"
    phone "42242244"
    rules "Rules"
  end
end
