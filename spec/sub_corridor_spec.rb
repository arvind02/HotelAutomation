require_relative '../lib/constants'
require_relative '../lib/sub_corridor'

RSpec.describe SubCorridor do
	
	describe 'initialize' do 
		it 'returns a new sub corridor instance' do 
			sc = SubCorridor.new
			expect(sc).to be_instance_of(SubCorridor)
		end

		it 'contains electric equipments instances' do 
			sc = SubCorridor.new
			expect(sc.light).to be_instance_of(ElectricEquipment)
			expect(sc.air_conditioner).to be_instance_of(ElectricEquipment)
		end
	end 

	describe 'turn_on_lights' do 
		it 'turns on the light' do 
			sc = SubCorridor.new
			expect(sc.turn_on_lights).to eq(STATUS_ON)
		end
	end

	describe 'turn_off_lights' do 
		it 'turns off the light' do 
			sc = SubCorridor.new
			expect(sc.turn_off_lights).to eq(STATUS_OFF)
		end
	end

	describe 'turn_on_ac' do 
		it 'turns on the ac' do 
			sc = SubCorridor.new
			expect(sc.turn_on_ac).to eq(STATUS_ON)
		end
	end

	describe 'turn_off_ac' do 
		it 'turns off the ac' do 
			sc = SubCorridor.new
			expect(sc.turn_off_ac).to eq(STATUS_OFF)
		end
	end


end