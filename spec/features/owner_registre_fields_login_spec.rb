require 'rails_helper'

feature 'Owner registre fields' do
  scenario 'sucessfully' do

    visit root_path
    click_on 'Cadastrar-se'
    click_on 'Quero Anunciar um Imovel'

    within('form#new_owner') do
      fill_in 'Nome', with: 'Joao'
      fill_in 'Email', with: 'joao@joao.com.br'
      fill_in 'Telefone', with: '1234-1234'
      fill_in 'Senha', with: '12345678'
      fill_in 'Confirme sua senha', with: '12345678'
      click_on 'Cadastrar'
    end

    expect(current_path).to eq root_path
    expect(page).to have_content('Bem vindo: Joao')
    expect(page).not_to have_link('Cadastrar-se')



  end
end
