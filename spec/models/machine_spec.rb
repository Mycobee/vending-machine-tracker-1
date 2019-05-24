require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
		it { should have_many(:machine_snacks)}
		it { should have_many(:snacks).through(:machine_snacks)}
  end

	describe 'instance methods' do 
		it '#average_price' do

			@owner = Owner.create!(name: "Bobby")
			@machine = @owner.machines.create!(location: "basement life")
			@snack_1 = @machine.snacks.create!(name: "Most Expensive Twix Ever", price: 4.00)
			@snack_2 = @machine.snacks.create!(name: "Snickers", price: 2.00)

			expect(@machine.average_price).to eq(3.00)
		end

	end
end
