require 'rails_helper'

feature 'View Proposal Confirmation' do
  scenario 'successefully' do

      owner = create(:owner, cpf: '11111111111', name: 'Carlos Adao')
      user = create(:user, name: 'Rogerio dos santos bispo', cpf: '32332323233')
      property = create(:property, owner: owner, property_type: 'Casa Praia',
      property_location: 'Avenida brasil praia grande')
      proposal = create(:proposal, property: property, user: user,
        start_date: '2017-07-10', end_date: '2017-08-10',
        total_amount: 1000.0)


      login_as(user, scope: :user)
      visit root_path

      click_on 'Minhas Propostas'
      click_on 'Ver Comprovante'

      expect(page).to have_content('Eu, Carlos Adao do CPF n: 11111111111')
      expect(page).to have_content('que alugo o imovel sito a: Avenida brasil praia grande')
      expect(page).to have_content('para Rogerio dos santos bispo portador do CPF: 32332323233')
      expect(page).to have_content('entre o periodo de 10/07/2017 a 10/08/2017')
      expect(page).to have_content('pelo valor de 1000.0 R$')
  end
end
