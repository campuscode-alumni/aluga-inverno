require 'rails_helper'

feature 'Visitor visit home and see home' do
  scenario 'successefully' do

    owner = Owner.create(email: 'teste1@teste1.com', name: 'Teste', password:'12345', phone:'1234-1234')
    property_type = create(:property_type, name: 'Chale')
    property = Property.create(maximum_guests: 10, minimum_rent: 4,
                               maximum_rent: 10, daily_rate: 230.0, property_type: property_type,
                               property_location: 'SP',
                               description: 'chale para festa', rules:'sem cachorros', picture: 'sem foto',owner: owner)


    another_property_type = create(:property_type, name: 'Casa')
    another_property = create(:property, property_type: another_property_type)
    visit root_path


      expect(page).to have_css('li', text: 'Chale')
      expect(page).to have_css('li', text: 'SP')
      expect(page).to have_css('li', text: 'Casa')
      expect(page).to have_css('li', text: 'Sao Paulo')

  end

  scenario 'Empty house' do
    visit root_path
    expect(page).to have_css('p', text: 'Nenhum propriedade disponivel')
  end

  scenario 'see house detail' do
    owner = Owner.create(email: 'teste1@teste1.com', name: 'Teste', password:'123456', phone:'1234-1234')
    property_type = create(:property_type, name: 'Chale')
    property = Property.create(maximum_guests: 10, minimum_rent: 2,
                               maximum_rent: 8, daily_rate: 230.0, property_type: property_type,
                               property_location: 'SP',
                               description: 'Chale para festa', rules:'Sem cachorros',picture: 'sem foto',owner: owner)


    visit root_path
    click_on 'Chale'

    expect(page).to have_css('h1', text: 'Detalhes da Propriedade')
    expect(page).to have_css('li', text: 'Tipo: Chale')
    expect(page).to have_css('li', text: 'Capacidade maxima: 10')
    expect(page).to have_css('li', text: 'Minimo dias de aluguel: 2')
    expect(page).to have_css('li', text: 'Maximo dias de aluguel: 8')
    expect(page).to have_css('li', text: 'Localizacao: SP')
    expect(page).to have_css('li', text: 'Descrição: Chale para festa')
    expect(page).to have_css('li', text: 'Regras: Sem cachorros')
    expect(page).to have_css('li', text: 'Valor: R$ 230.0')
    expect(page).to have_css('li', text: 'Foto: sem foto')
    expect(page).to have_css('h2', text: 'Contatos')
    expect(page).to have_css('li', text: 'Nome: Teste')
    expect(page).to have_css('li', text: 'Email: teste1@teste1.com')
    expect(page).to have_css('li', text: 'Telefone: 1234-1234')
  end
end
