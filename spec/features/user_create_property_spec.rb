require 'rails_helper'

feature 'Visitor create property' do
  scenario 'successefully' do
    owner =   Owner.create(email: 'campus@campus.com.br', password: '1234567', name: 'Joao H', phone: '91111-2222')
    login_as(owner, scope: :owner)

    visit root_path
    click_on 'Cadastrar uma Propiedade'

    fill_in 'Tipo', with: 'Apartamento'
    fill_in 'Capacidade maxima', with: 10
    fill_in 'Minimo dias de aluguel', with: 2
    fill_in 'Maximo dias de aluguel', with: 5
    fill_in 'Finalidade', with: 'Passar Ferias'
    fill_in 'Localizacao', with: 'BA'
    fill_in 'Descrição', with: 'Apartamento perto do Centro'
    fill_in 'Regras', with: 'Não fumar no apartamento'
    fill_in 'Valor', with: 40.0
    fill_in 'Foto', with: 'sem fotos'

    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Detalhes da Propiedade')
    expect(page).to have_css('li', text: 'Tipo: Apartamento')
    expect(page).to have_css('li', text: 'Capacidade maxima: 10')
    expect(page).to have_css('li', text: 'Minimo dias de aluguel: 2')
    expect(page).to have_css('li', text: 'Maximo dias de aluguel: 5')
    expect(page).to have_css('li', text: 'Finalidade: Passar Ferias')
    expect(page).to have_css('li', text: 'Localizacao: BA')
    expect(page).to have_css('li', text: 'Descrição: Apartamento perto do Centro')
    expect(page).to have_css('li', text: 'Regras: Não fumar no apartamento')
    expect(page).to have_css('li', text: 'Valor: R$ 40.0')
    expect(page).to have_css('li', text: 'Foto: sem fotos')
    expect(page).to have_css('h2', text: 'Contatos')
    expect(page).to have_css('li', text: 'Nome: Joao H')
    expect(page).to have_css('li', text: 'Email: campus@campus.com.br')
    expect(page).to have_css('li', text: 'Telefone: 91111-2222')

  end

  scenario 'Must fill all fields' do
    owner =   Owner.create(email: 'campus@campus.com.br', password: '1234567')

    visit root_path
    login_as(owner, :scope => :owner)
    click_on 'Cadastrar uma Propiedade'

    fill_in 'Tipo', with: ''
    fill_in 'Capacidade maxima', with: 0
    fill_in 'Minimo dias de aluguel', with:0
    fill_in 'Maximo dias de aluguel', with:0
    fill_in 'Finalidade', with: ''
    fill_in 'Localizacao', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Regras', with: ''
    fill_in 'Valor', with: 0
    fill_in 'Foto', with: ''
    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'Telefone', with: ''

    click_on 'Enviar'

    expect(page).to have_css('p', text: 'Todos os campos devem ser preenchidos')

  end

  scenario 'User not login' do

    visit root_path
    click_on 'Cadastrar uma Propiedade'

    expect(current_path).to eq new_owner_session_path

  end
end
