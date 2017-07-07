require 'rails_helper'

feature 'Visitor visit home and see home' do
  scenario 'successefully' do
    property = Property.create(maximum_guests: 10, minimum_rent: 4,
      maximum_rent: 10, daily_rate: 230.0, property_type: 'chale',
      rent_purpose: 'Festa', property_location: 'SP',
      description: 'chale para festa')

      visit root_path

      expect(page).to have_css('li', 'chale')
      expect(page).to have_css('li', 'SP')
  end
  scenario 'Empty house' do

      visit root_path

      expect(page).to have_css('p', 'Nenhum propriedade disponivel')
  end
  
end
