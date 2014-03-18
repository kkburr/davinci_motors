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

    expect(page).to have_content("1967 Ford Mustang created")

    visit '/'

    expect(page).to have_content('1967')
    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('$2,300.00')
  end

  #new scenario is a new database
  scenario "can create a second car" do
    visit "/"

    click_link 'New Car'

    #@car = Car.create(make: "Chevy", model: "Impala", year: "2002", price: 314.12)

    fill_in 'Year', with: '2002'
    fill_in 'Make', with: 'Chevy'
    fill_in 'Model', with: 'Impala'
    fill_in 'Price', with: '314.12'

    click_button 'Create Car'

    expect(page).to have_content("2002 Chevy Impala created")

    visit "/"

      click_link 'New Car'

      fill_in 'Year', with: '1995'
      fill_in 'Make', with: 'Toyota'
      fill_in 'Model', with: 'Camry'
      fill_in 'Price', with: '2300'

      click_button 'Create Car'

    expect(page).to have_content("1995 Toyota Camry created")

  end
end


