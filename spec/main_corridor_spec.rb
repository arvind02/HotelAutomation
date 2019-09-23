require_relative '../lib/constants'
require_relative '../lib/main_corridor'

RSpec.describe MainCorridor do
	
	describe 'initialize' do 
		it 'returns a new sub corridor instance' do 
			mc = MainCorridor.new
			expect(mc).to be_instance_of(MainCorridor)
		end

		it 'contains electric equipments instances' do 
			mc = MainCorridor.new
			expect(mc.light).to be_instance_of(ElectricEquipment)
			expect(mc.air_conditioner).to be_instance_of(ElectricEquipment)
		end
	end 

	describe 'power_consumption' do 
		it 'calculates power consumption' do 
			mc = MainCorridor.new
			expect(mc.power_consumption).to eq(15)
		end
	end
end