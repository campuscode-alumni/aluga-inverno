require 'rails_helper'

feature 'Owner can add photo' do
  scenario 'Sucessfully' do
      owner = create(:owner)
      property_type = create(:property_type, name: 'Casa de Campo')
      property = create(:property, property_type: property_type, owner: owner)
      login_as(owner, scope: :owner)

      visit root_path
      click_on 'Casa de Campo'
      click_on 'Editar'
      attach_file('Imagem', "#{Rails.root}/spec/images/casa_01.jpeg")
      click_on 'Enviar'

      expect(page).to have_xpath("//img[contains(@src,'casa_01.jpeg')]")

  end

  scenario 'default not image' do
    owner = create(:owner)
    property_type = create(:property_type, name: 'Casa de Campo')
    property = create(:property, property_type: property_type, owner: owner, photo: nil)

    login_as(owner, scope: :owner)
    visit root_path

    click_on 'Casa de Campo'
    expect(page).to have_xpath("//img[contains(@src,'default')]")

  end

  scenario 'home must have picture' do
    property = create(:property)
    owner = create(:owner, email: 'roger@teste.com.br')
    property1 = create(:property, photo: nil,owner: owner)
    visit root_path
    expect(page).to have_xpath("//img[contains(@src,'default')]")
    expect(page).to have_xpath("//img[contains(@src,'casa_01.jpeg')]")

  end

end
