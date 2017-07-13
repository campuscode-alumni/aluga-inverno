require 'rails_helper'

feature 'Send Proposal Confirmation' do
  scenario 'successefully' do

      owner = create(:owner)
      user = create(:user)
      property = create(:property, owner: owner)
      proposal = create(:proposal, property: property, user: user)

      visit root_path





  end
end
