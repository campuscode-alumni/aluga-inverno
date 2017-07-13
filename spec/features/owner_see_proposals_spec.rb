require 'rails_helper'

feature 'Owner see proposals' do

 scenario 'successefully' do
   owner = Owner.create(email: 'teste@teste.com',name: 'teste', password: '123456', phone: '4444-4444')
   property = create(:property,owner: owner)
   proposal = create(:proposal,property:property)

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

   owner = Owner.create(email: 'teste@teste.com',name: 'teste', password: '123456', phone: '4444-4444')

   property = Property.create(maximum_guests: 10, minimum_rent: 4,
     maximum_rent: 10, daily_rate: 230.0, property_type: 'Chale',
     rent_purpose: 'Festas', property_location: 'SP',
     description: 'chale para festa', rules:'sem cachorros', picture: 'sem foto',owner: owner)

   proposal = Proposal.create(start_date:'2017-05-06', end_date:'2017-05-07',
    total_amount:'100.50', total_guests:2, rent_purpose: 'Ferias', name:'Joao',
    email:'joao@joao.com', cpf:'123456789-99', phone:'1234-1234',
    extra_info: 'Quero passar minhas ferias nessa propriedade!',property: property)

   another_owner = Owner.create(email: 'Rogerio@teste.com',name: 'Rogerio',
    password: '102030', phone: '555-555')

   login_as(another_owner, scope: :owner)
   visit root_path

   click_on 'Chale'
   expect(page).not_to have_link('Ver Propostas')
 end

 scenario 'to see proposal user must be loged in' do

   proposal = create(:proposal)

   owner = Owner.create(email: 'teste@teste.com',name: 'teste', password: '123456', phone: '4444-4444')
   login_as(owner, scope: :owner)

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
end
