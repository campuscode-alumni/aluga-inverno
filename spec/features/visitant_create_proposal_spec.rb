require 'rails_helper'

feature 'Visitante realiza proposta' do
  scenario 'sucessfully' do

    #prepare data
    prop = create(:property, daily_rate: 50)

    #simulate user action
    visit root_path
    click_on 'Casa'
    click_on 'Efetuar Oferta'

    fill_in 'Nome', with: 'Lucas'
    fill_in 'email', with: 'lucasfe@gmail.com'
    fill_in 'cpf', with: '123.456.789-77'
    fill_in 'telefone', with: '11971331011'

    fill_in 'data inicial', with: '2017-07-01'
    fill_in 'data final', with: '2017-07-05'
    fill_in 'proposito', with: 'Ferias'
    fill_in 'infs extra', with: 'None'

    click_on 'Enviar'

    #expectations

    expect(page).to have_content('Detalhes da Proposta')
    expect(page).to have_content('Nome: Lucas')
    expect(page).to have_content('Data final: 05/07/2017')
    expect(page).to have_content('lucasfe@gmail.com')
    expect(page).to have_content('Total: R$ 250.00')
  end


  scenario 'check aviability of property before save proposal' do
    #prepare data
    prop = create(:proposal, start_date:'2017-08-06', end_date: '2017-08-07', accept:1)

    #simulate user action
    visit root_path
    click_on 'Casa'
    click_on 'Efetuar Oferta'

    fill_in 'Nome', with: 'Lucas'
    fill_in 'email', with: 'lucasfe@gmail.com'
    fill_in 'cpf', with: '123.456.789-77'
    fill_in 'telefone', with: '11971331011'

    fill_in 'data inicial', with: '2017-08-06'
    fill_in 'data final', with: '2017-08-07'
    fill_in 'proposito', with: 'Ferias'
    fill_in 'infs extra', with: 'None'

    click_on 'Enviar'
      expect(page).to have_css('p', text: 'Este periodo esta indisponivel')
  end

  scenario 'Calculate value acording to prices' do
      prop = create(:property,daily_rate: 20)
      price = create(:price, property: prop, start_date: '2017-07-11', end_date: '2017-07-21',total_amount: 500)

      visit root_path

      click_on 'Casa'
      click_on 'Efetuar Oferta'

      fill_in 'Nome', with: 'Lucas'
      fill_in 'email', with: 'lucasfe@gmail.com'
      fill_in 'cpf', with: '123.456.789-77'
      fill_in 'telefone', with: '11971331011'
      fill_in 'data inicial', with: '2017-07-11'
      fill_in 'data final', with: '2017-07-20'
      fill_in 'proposito', with: 'Ferias'
      fill_in 'infs extra', with: 'None'

      click_on 'Enviar'

      expect(page).to have_content('Detalhes da Proposta')
      expect(page).to have_content('Nome: Lucas')
      expect(page).to have_content('Data inicial: 11/07/2017')
      expect(page).to have_content('Data final: 20/07/2017')
      expect(page).to have_content('Total: R$ 5000.00')
      expect(page).to have_content('lucasfe@gmail.com')

  end
end
