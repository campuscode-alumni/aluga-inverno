require 'rails_helper'

feature 'User evaluate properties' do

  scenario 'successfully' do
    user = create(:user, email: 'joao@joao.com', name: 'Joao H')
    property = create(:property)
    proposals = create(:proposal, property: property, user:user, accept: 1)
    login_as(user, scope: :user)

    visit root_path

    click_on 'Casa'
    click_on 'Avaliar este imovel'

    select '5 estrelas'
    fill_in 'Comentario', with: 'Muito bom!'

    click_on 'Enviar'

    expect(current_path).to eq property_path(property)
    expect(page).to have_content('Joao H')
    expect(page).to have_content('5 estrelas')
    expect(page).to have_content('Muito bom!')
  end

  scenario 'only if user has a accepted proposal' do
    user = create(:user, email: 'joao@joao.com', name: 'Joao H')
    property = create(:property)
    proposals = create(:proposal, property: property, user:user, accept: 0)

    login_as(user, scope: :user)
    visit root_path

    click_on 'Casa'

    expect(page).not_to have_link('Avaliar este imovel')
  end

  scenario 'and cannot review more than one time' do
    user = create(:user, email: 'joao@joao.com', name: 'Joao H')
    property = create(:property)
    proposals = create(:proposal, property: property, user:user, accept: 1)
    review = create(:review, user: user, property: property)

    login_as(user, scope: :user)
    visit root_path

    click_on 'Casa'

    expect(page).not_to have_link('Avaliar este imovel')
  end
end
