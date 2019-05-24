
require 'rails_helper'

RSpec.describe 'as a visitor on a snack show page' do
	it 'shows the name of all snacks and their price' do
		@owner = Owner.create!(name: "Bobby")
		@machine_1 = @owner.machines.create!(location: "basement life")
		@machine_2 = @owner.machines.create!(location: "more basement life")
		@snack_1 = @machine_1.snacks.create!(name: "Most Expensive Twix Ever", price: 4.00)
		@snack_2 = @machine_1.snacks.create!(name: "Snickers", price: 2.00)
		@machine_2.snacks << @snack_1	
		@machine_2.snacks << @snack_2	
		
		visit snack_path(@snack_1)

		expect(page).to have_content(@machine_1.owner)
		expect(page).to have_content(@machine_1.location)


		expect(page).to have_content(@machine_2.owner)
		expect(page).to have_content(@machine_2.location)

		expect(page).to have_content(@machine_1.type_count)
		expect(page).to have_content(@machine_2.type_count)
	end
end
