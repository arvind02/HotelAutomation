
require_relative '../lib/electric_equipment'


RSpec.describe ElectricEquipment do 

	describe 'initialize' do 
		context 'given input parameters is correct' do
			it 'returns new electric equipment instance' do 
				ee = ElectricEquipment.new('ON', 10)
				expect(ee.status).to eq('ON')
				expect(ee.units).to eq(10)
			end
		end

		context 'given input paramaters have partial or no parameters' do
          it 'throws exception due to missing argument errors' do
            expect { ElectricEquipment.new(2) }.to raise_error(ArgumentError)
          end
        end
	end

	describe 'turn_on' do 
		context 'given parameters are correct and status is on' do
			it 'updates status to on' do
				ee = ElectricEquipment.new('OFF', 10)
				expect(ee.turn_on).to eq('ON')
			end 
		end
	end

	describe 'turn_off' do 
		context 'given parameters are correct and status is off' do
			it 'updates status to off' do
				ee = ElectricEquipment.new('ON', 10)
				expect(ee.turn_off).to eq('OFF')
			end 
		end
	end

	describe 'status' do 
		context 'given parameters are correct and status is as provided' do
			it 'shows initialized status' do
				ee = ElectricEquipment.new('ON', 10)
				expect(ee.status).to eq('ON')
			end 
		end
	end

	describe 'power_consumption' do 
		context 'given parameters are correct and units being calculated' do
			it 'calculates the power consumption' do
				ee = ElectricEquipment.new('ON', 10)
				expect(ee.power_consumption).to eq(10)
			end 

			it 'calculates the power consumption' do
				ee = ElectricEquipment.new('OFF', 10)
				expect(ee.power_consumption).to eq(0)
			end	

			it 'raise error if status is missing' do
				expect { ElectricEquipment.new(10).power_consumption}.to raise_error(ArgumentError)
			end		
		end
	end
end