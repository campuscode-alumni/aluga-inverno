require 'rails_helper'

feature 'Owner registre fields' do
  scenario 'sucessfully' do

    visit root_path
    click_on 'Acessar'
    click_on 'Quero Alugar um Imovel'
    click_on 'Cadastrar-se'


      fill_in 'Email', with: 'joao@joao.com.br'
      fill_in 'Senha', with: '12345678'
      fill_in 'Confirme sua senha', with: '12345678'
      click_on 'Cadastrar'


    expect(current_path).to eq root_path
    expect(page).to have_content('Bem vindo: joao@joao.com.br')
    expect(page).not_to have_link('Cadastrar-se')
  end
end
