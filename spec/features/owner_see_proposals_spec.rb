require 'rails_helper'

feature 'Owner see proposals' do
 scenario 'successefully' do
  owner = Owner.create(email: 'teste@teste.com',name: 'teste', password: '123456', phone: '4444-4444')
   proposal = create(:proposal, owner: owner)

   login_as(owner, scope: :owner)
   visit root_path
   click_on 'Ver Propostas'

   expect(page).to have_css('h1', text: 'Minhas Propostas')
   expect(page).to have_content('Propiedade: Casa - Festas - Sao Paulo')
   expect(page).to have_content('Nome: Lucas')
   expect(page).to have_content('Data final: 07/08/2017')
   expect(page).to have_content('lucasfe@gmail.com')
 end
end
