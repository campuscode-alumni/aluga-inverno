require 'rails_helper'

feature 'user login and logout' do
  scenario 'successfully' do
    owner = create(:owner, email: 'joao@joao.com', name: 'Joao H')
    login_as(owner, scope: :owner)

    visit root_path
    click_on 'Sair'

    expect(page).not_to have_content('Bem vindo: Joao H')
  end

  scenario 'successfully' do
    user = create(:user, email: 'joao@joao.com', name: 'Joao H')
    login_as(user, scope: :user)

    visit root_path
    click_on 'Sair'

    expect(page).not_to have_content('Bem vindo: Joao H')
  end
end
