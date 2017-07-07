require 'rails_helper'

feature 'Visitor visit home and see home' do
  scenario 'successefully' do
    property = Property.create(maximum_guests: 10, minimum_rent: 4,
      maximum_rent: 10, daily_rate: 230.0, property_type: 'chale',
      rent_purpose: 'Festas', property_location: 'SP',
      description: 'chale para festa', rules:'sem cachorros', picture: 'sem foto',owner: 'Joao H.',
      email: 'joao@joao.com',phone: '4224-2010')

    property = Property.create(maximum_guests: 10, minimum_rent: 4,
        maximum_rent: 50, daily_rate: 230.0, property_type: 'Casa na praia',
        rent_purpose: 'Temporada', property_location: 'RJ',
        description: 'Casa proximo a praia', rules:'sem cachorros',picture: 'sem foto',owner: 'Joao H.',
        email: 'joao@joao.com',phone: '4224-2010')
      visit root_path

      expect(page).to have_css('li', text: 'chale')
      expect(page).to have_css('li', text: 'SP')
      expect(page).to have_css('li', text: 'Festas')

      expect(page).to have_css('li', text: 'Casa na praia')
      expect(page).to have_css('li', text: 'RJ')
      expect(page).to have_css('li', text: 'Temporada')
  end

  scenario 'Empty house' do
    visit root_path
    expect(page).to have_css('p', text: 'Nenhum propriedade disponivel')
  end

  scenario 'see house detail' do
    property = Property.create(maximum_guests: 10, minimum_rent: 2,
      maximum_rent: 8, daily_rate: 230.0, property_type: 'chale',
      rent_purpose: 'Festa', property_location: 'SP',
      description: 'Chale para festa', rules:'Sem cachorros',picture: 'sem foto',owner: 'Joao H.',
      email: 'joao@joao.com',phone: '4224-2010')

    visit root_path
    click_on 'chale'

    expect(page).to have_css('h1', text: 'Detalhes da Propiedade')
    expect(page).to have_css('li', text: 'Tipo: chale')
    expect(page).to have_css('li', text: 'Capacidade maxima: 10')
    expect(page).to have_css('li', text: 'Minimo dias de aluguel: 2')
    expect(page).to have_css('li', text: 'Maximo dias de aluguel: 8')
    expect(page).to have_css('li', text: 'Finalidade: Festa')
    expect(page).to have_css('li', text: 'localizacao: SP')
    expect(page).to have_css('li', text: 'Descrição: Chale para festa')
    expect(page).to have_css('li', text: 'Regras: Sem cachorros')
    expect(page).to have_css('li', text: 'Valor: R$ 230.0')
    expect(page).to have_css('li', text: 'Foto: sem foto')
    expect(page).to have_css('h2', text: 'Contatos')
    expect(page).to have_css('li', text: 'Nome: Joao H.')
    expect(page).to have_css('li', text: 'Email: joao@joao.com')
    expect(page).to have_css('li', text: 'Telefone: 4224-2010')
  end
end
