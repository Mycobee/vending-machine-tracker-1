require 'rails_helper'

RSpec.describe 'as a visitor on a snack show page' do
	it 'shows the name of all snacks and their price' do
		@owner = Owner.create!(name: "Bobby")
		@machine = @owner.machines.create!(location: "basement life")
		@snack_1 = @machine.snacks.create!(name: "Most Expensive Twix Ever", price: 4.00)
		@snack_2 = @machine.snacks.create!(name: "Snickers", price: 2.00)
		
		visit machine_path(@machine)

		expect(page).to have_content(@snack_1.name)
		expect(page).to have_content(@snack_1.price)

		expect(page).to have_content(@snack_2.name)
		expect(page).to have_content(@snack_2.price)
	end
end
#```
#User Story 1 of 3
#
#As a user
#When I visit a vending machine show page
#I see the name of all of the snacks associated with that vending machine along with their price
#```
