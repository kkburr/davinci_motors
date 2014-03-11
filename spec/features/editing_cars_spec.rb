require 'spec_helper'

feature "Editing Cars" do
  scenario "allows you to update the car info" do
    visit "/"
    @car = Car.create(make: "Chevy", model: "Impala", year: "2002", price: 314.12)

    within("#car_#{@car.id}") do
      click_link 'Edit'
    end

    fill_in 'Year', with: '1996'
    fill_in 'Price', with: '2500'

    click_button 'Update Car'

    expect(page).to have_content('Year: 1996')
    expect(page).to have_content('Price: $2,500')
  end
end