require 'rails_helper'

feature 'View Proposal Confirmation' do
  scenario 'successefully' do

      owner = create(:owner, cpf: '11111111111', name: 'Carlos Adao')
      user = create(:user, name: 'Rogerio dos santos bispo', cpf: '32332323233')
      property_type = create(:property_type, name: 'Chale')
      property = create(:property, owner: owner, property_type: property_type,
      property_location: 'Avenida brasil praia grande',
      rules: 'Não e permitido animais, A casa deve estar limpa na devolucao', maximum_guests: 40)
      proposal = create(:proposal, property: property, user: user,
        start_date: '2017-07-10', end_date: '2017-08-10',
        total_amount: 1000.0, accepted_at: '2017-10-05')


      login_as(user, scope: :user)
      visit root_path

      click_on 'Minhas Propostas'
      click_on 'Ver Comprovante'

      expect(page).to have_css('center', text: 'Comprovante de locação')
      expect(page).to have_content('Eu, Carlos Adao do CPF n: 11111111111')
      expect(page).to have_content('que alugo o imovel sito a: Avenida brasil praia grande')
      expect(page).to have_content('para Rogerio dos santos bispo portador do CPF: 32332323233')
      expect(page).to have_content('entre o periodo de 10/07/2017 a 10/08/2017')
      expect(page).to have_content('pelo valor total de R$ 1.000,00')
      expect(page).to have_content('Para este período devem ser respeitados a seguinte regras de uso:')
      expect(page).to have_content('- O imovel nao deve ser hospedado por mais que 40 pessoas;')
      expect(page).to have_content('- O prazo de locacao deve ser respeitado e casos de renovacoes devem ser tratados diretamente com o proprietario;')
      expect(page).to have_content('- Alem destas devem ser respeitadas as seguintes regras:')
      expect(page).to have_content('Não e permitido animais, A casa deve estar limpa na devolucao')
      expect(page).to have_content('Sao Paulo, 05 de Outubro de 2017')
  end
end
