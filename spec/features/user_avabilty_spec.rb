require 'rails_helper'

feature 'User avability properties' do

  scenario 'successefully' do
    user = create(:user, email: 'joao@joao.com', name: 'Joao H')
    property = create(:property)

    login_as(user, scope: :user)

    visit root_path

    click_on 'Casa'
    click_on 'Avaliar este imovel'

    check '5 estrelas'
    fill_in 'Comentario', with: 'Muito bom!'

    click_on 'Enviar'

    expect(current_path).to eq property_path(property)
    expect(page).to have_content('Joao H')
    expect(page).to have_content('5 estrelas')
    expect(page).to have_content('Muito bom!')
  end
end
