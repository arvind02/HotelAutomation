require_relative '../lib/constants'
require_relative '../lib/sub_corridor'
require_relative '../lib/electric_equipment'

RSpec.describe SubCorridor do
	
	subject { described_class.new }
	
	describe 'initialize' do 

		context 'with proper parameters' do
			it 'expect a sub corridor instance' do 
				expect(subject).to be_instance_of(described_class)
			end
		end

		context 'given input paramaters' do
          	it 'throws exception due to not required parameters' do
            	expect { described_class.new(2) }.to raise_error(ArgumentError)
          	end
        end

        context 'after initialize check attributes' do 
        	it 'expects electric equipments attributes' do 
        		expect(subject).to have_attributes(light: be_instance_of(ElectricEquipment))
        		expect(subject).to have_attributes(air_conditioner: be_instance_of(ElectricEquipment))
        	end
        end
	end

	describe 'Different methods behaviour' do 

		context 'confirm an object can respond to Sub Corridor' do
			it 'expects to be instance method of Sub Corridor class' do
			    expect(subject).to respond_to(:current_status)
			    expect(subject).to respond_to(:turn_on_lights)
			    expect(subject).to respond_to(:turn_off_lights)
			    expect(subject).to respond_to(:turn_on_ac)
			    expect(subject).to respond_to(:turn_off_ac)
			    expect(subject).to respond_to(:power_consumption)
			end
		end
		
		context 'Let\'s call sub corridor class methods' do
			it 'expects working instance methods of sub_corridor class' do 
				subject.current_status(1)
				subject.turn_on_lights
				subject.turn_off_lights
				subject.turn_on_ac
				subject.turn_off_ac
				subject.power_consumption
			end
		end 
	end	 

	describe 'Individual methods Behaviour' do

		context 'check current_status method' do
			it 'expects output not to be nil' do 
				expect(subject.current_status(1)).not_to be_nil
			end

			it 'expects output as a string' do 
				expect(subject.current_status(1)).to be_instance_of(String)
			end

			it 'expects inclusion of main sub string in output' do 
				expect(subject.current_status(1)).to include('Light')
			end 

			it 'expects inclusion of sub sub string in output' do 
				expect(subject.current_status(1)).to include('AC')
			end   
		end

		context 'check turn_on_lights method' do
			it 'expects output not to be nil' do 
				expect(subject.turn_on_lights).not_to be_nil
			end

			it 'expects output as a string' do 
				expect(subject.turn_on_lights).to be_instance_of(String)
			end

			it 'expects output to be equals to STATUS_ON' do 
				expect(subject.turn_on_lights).to eq(STATUS_ON)
			end 
		end

		context 'check turn_off_lights method' do
			it 'expects output not to be nil' do 
				expect(subject.turn_off_lights).not_to be_nil
			end

			it 'expects output as a string' do 
				expect(subject.turn_off_lights).to be_instance_of(String)
			end

			it 'expects output to be equals to STATUS_OFF' do 
				expect(subject.turn_off_lights).to eq(STATUS_OFF)
			end 
		end

		context 'check turn_on_ac method' do
			it 'expects output not to be nil' do 
				expect(subject.turn_on_ac).not_to be_nil
			end

			it 'expects output as a string' do 
				expect(subject.turn_on_ac).to be_instance_of(String)
			end

			it 'expects output to be equals to STATUS_ON' do 
				expect(subject.turn_on_ac).to eq(STATUS_ON)
			end 
		end

		context 'check turn_off_ac method' do
			it 'expects output not to be nil' do 
				expect(subject.turn_off_ac).not_to be_nil
			end

			it 'expects output as a string' do 
				expect(subject.turn_off_ac).to be_instance_of(String)
			end

			it 'expects output to be equals to STATUS_OFF' do 
				expect(subject.turn_off_ac).to eq(STATUS_OFF)
			end 
		end

		context 'check power_consumption method' do 
			it 'expects output not to be nil' do 
				expect(subject.power_consumption).not_to be_nil
			end

			it 'expects output as a integer' do 
				expect(subject.power_consumption).to be_instance_of(Integer)
			end

			it 'power consumption should be 10' do 
				expect(subject.power_consumption).to eq(10)
			end

			it 'expect the total power consumption based on light and air_conditioner' do 
				expect(subject.power_consumption).to be_equal(subject.light.power_consumption + subject.air_conditioner.power_consumption )
			end
		end
	end

end

