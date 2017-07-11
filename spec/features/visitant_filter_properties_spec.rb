require 'rails_helper'

feature 'visitant filter properties by state' do
  scenario 'sucessfully' do
    #create mock property
    owner = Owner.create(email: 'teste1@teste1.com', name: 'Teste', password:'12345', phone:'1234-1234')
    prop = create(:property,owner: owner)
    another_prop = create(:property, property_location: "Rio de Janeiro")
    #user actions simulation
    visit root_path

    fill_in 'Busca', with: 'Rio de Janeiro'
    click_on 'Buscar'

    #expectations
    expect(page).not_to have_content('Sao Paulo')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('Resultado da busca')


  end
end
