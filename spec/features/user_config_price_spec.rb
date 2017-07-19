require 'rails_helper'

feature 'Visitor conf price' do
  scenario 'successefully' do
    owner = Owner.create(email: 'campus@campus.com.br', password: '1234567', name: 'Joao H', phone: '91111-2222')
    login_as(owner, scope: :owner)

    property = Property.create(maximum_guests: 10, minimum_rent: 4,
      maximum_rent: 10, daily_rate: 230.0, property_type: 'chale',
      property_location: 'SP',
      description: 'chale para festa', rules:'sem cachorros', picture: 'sem foto',owner: owner)


    visit root_path
    click_on 'chale'
    click_on 'Configurar Preco'

    fill_in 'Temporada', with: 'Natal'
    fill_in 'Data inicio', with: '2017-07-07'
    fill_in 'Data fim', with: '2017-08-08'
    fill_in 'Valor da diaria', with: '100.00'

    click_on 'Enviar'

    expect(current_path).to eq property_path(property)

    expect(page).to have_content('Precos por Temporada')
    expect(page).to have_content('Temporada: Natal')
    expect(page).to have_content('Data inicio: 07/07/2017')
    expect(page).to have_content('Data fim: 08/08/2017')
    expect(page).to have_content('Valor da diaria: 100.00')

    end
end
