require 'spec_helper'

feature "Creating Cars" do
  scenario "can create a car" do
    visit '/'

    click_link 'New Car'

    fill_in 'Year', with: '1967'
    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('Year: 1967')
    expect(page).to have_content('Make: Ford')
    expect(page).to have_content('Model: Mustang')
    expect(page).to have_content('Price: 2300')
  end
  scenario "can create a second car" do
      visit "/"

      click_link 'New Car'

      fill_in 'Year', with: '1995'
      fill_in 'Make', with: 'Toyota'
      fill_in 'Model', with: 'Camry'
      fill_in 'Price', with: '2300'

      click_button 'Create Car'

      expect(page).to have_content
      expect(page).to have_content('Year: 1995')
      expect(page).to have_content('Make: Toyota')
      expect(page).to have_content('Model: Camry')
      expect(page).to have_content('Price: 2300')
  end
end

#feature "Editing Cars" do
#  scenario "can edit a car" do
#    visit "/"
#
#    click_link 'New Car'
#
#    fill_in 'Year', with: '1995'
#    fill_in 'Make', with: 'Toyota'
#    fill_in 'Model', with: 'Camry'
#    fill_in 'Price', with: '2300'
#
#    click_button 'Create Car'
#
#    click_link 'Edit'
#
#    fill_in 'Year', with: '1996'
#    fill_in 'Price', with: '2500'
#
#    click_button 'Update Car'
#
#    expect(page).to have_content('Year: 1996')
#    expect(page).to have_content('Make: Toyota')
#    expect(page).to have_content('Model: Camry')
#    expect(page).to have_content('Price: 2500')
#  end
#end