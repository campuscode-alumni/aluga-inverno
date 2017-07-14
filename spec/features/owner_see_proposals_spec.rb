require 'rails_helper'

feature 'Owner see proposals' do

 scenario 'successefully' do
   owner = Owner.create(email: 'teste@teste.com', name: 'teste', password: '123456', phone: '4444-4444')
   user = create(:user, name: 'Lucas', phone: '1234-1234', email: 'lucasfe@gmail.com')
   property = create(:property, owner: owner)
   proposal = create(:proposal, property: property, user: user)

   login_as(owner, scope: :owner)
   visit root_path

   click_on 'Casa'
   click_on 'Ver Propostas'

   expect(page).to have_css('h1', text: 'Minhas Propostas')
   expect(page).to have_content('Propiedade: Casa - Festas - Sao Paulo')
   expect(page).to have_content('Nome: Lucas')
   expect(page).to have_content('Data inicial: 06/08/2017')
   expect(page).to have_content('Data final: 07/08/2017')
   expect(page).to have_content('Telefone: 1234-1234')
   expect(page).to have_content('Email: lucasfe@gmail.com')
 end

 scenario 'Owner only see proposals of his properties' do

   owner = create(:owner, email: 'teste10@teste.com.br')

   property = create(:property, owner: owner, property_type: 'Chale')

   proposal = create(:proposal)

   another_owner = Owner.create(email: 'Rogerio@teste.com',name: 'Rogerio',
    password: '102030', phone: '555-555')

   login_as(another_owner, scope: :owner)

   visit root_path

   click_on 'Chale'
   expect(page).not_to have_link('Ver Propostas')
 end

 scenario 'to see proposal user must be loged in' do

   proposal = create(:proposal)

   another_owner = Owner.create(email: 'teste@teste.com',name: 'teste', password: '123456', phone: '4444-4444')
   login_as(another_owner, scope: :owner)

   visit property_proposals_path(proposal.property.id)
   expect(current_path).to eq root_path

 end

 scenario 'to see proposal and acept' do

   owner = Owner.create(email: 'teste@teste.com',name: 'teste', password: '123456', phone: '4444-4444')
   property = create(:property,owner: owner)
   proposal = create(:proposal,property:property)

   login_as(owner, scope: :owner)
   visit root_path

   click_on 'Casa'
   click_on 'Ver Propostas'

   within("div#proposal_#{proposal.id}") do
     click_on 'Aceitar Proposta'
   end
   expect(current_path).to eq property_proposals_path(proposal.property.id)

   within("div#proposal_#{proposal.id}") do
     expect(page).to have_content('Proposta Aceita')
   end
  end

  scenario 'not exist proposals' do
    owner = Owner.create(email: 'teste@teste.com',name: 'teste', password: '123456', phone: '4444-4444')
    property = create(:property,owner: owner)
    login_as(owner, scope: :owner)
    visit root_path

    click_on 'Casa'
    click_on 'Ver Propostas'

    expect(page).to have_content('Sem Propostas para essa propriedade!')
  end
end
