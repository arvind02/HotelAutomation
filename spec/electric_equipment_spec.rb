require_relative '../lib/constants'
require_relative '../lib/electric_equipment'


RSpec.describe ElectricEquipment do 

	subject {described_class.new(STATUS_ON, AC_UNITS)}

	describe 'initialize' do 

		context 'with proper parameters' do
			it 'expect a sub corridor instance' do 
				expect(subject).to be_instance_of(described_class)
			end
		end

		context 'given input paramaters' do
          	it 'throws exception due to not required parameters' do
            	expect { described_class.new(STATUS_ON) }.to raise_error(ArgumentError)
          	end
        end

        context 'after initialize check attributes' do 
        	it 'expects correct values of attributes' do 
        		expect(subject).to have_attributes(status: STATUS_ON)
        		expect(subject).to have_attributes(units: AC_UNITS)
        	end
        end
	end

	describe 'Different methods behaviour' do 

		context 'confirm an object can respond to ElectricEquipment' do
			it 'expects to be instance method of ElectricEquipment class' do
			    expect(subject).to respond_to(:turn_on)
			    expect(subject).to respond_to(:turn_off)
			    expect(subject).to respond_to(:status)
			    expect(subject).to respond_to(:power_consumption)
			end
		end
		
		context 'Let\'s call ElectricEquipment class methods' do
			it 'expects working instance methods of ElectricEquipment class' do 
				subject.turn_on
				subject.turn_off
				subject.status
				subject.power_consumption
			end
		end 
	end	 

	describe 'Individual methods Behaviour' do

		context 'check turn_on method' do
			let(:elec_equp) { described_class.new(STATUS_OFF, LIGHT_UNITS) }

			it 'expects output not to be nil' do 
				expect(subject.turn_on).not_to be_nil
			end

			it 'expects output as a string' do 
				expect(subject.turn_on).to be_instance_of(String)
			end

			it 'expects status to be ON' do 
				expect(subject.turn_on).to eq(STATUS_ON)
			end 

			it 'expects to update status to ON' do 
				expect(elec_equp.turn_on).to be_equal(STATUS_ON)
			end   
		end

		context 'check turn_off method' do
			let(:elec_equp) { described_class.new(STATUS_ON, LIGHT_UNITS) }

			it 'expects output not to be nil' do 
				expect(subject.turn_off).not_to be_nil
			end

			it 'expects output as a string' do 
				expect(subject.turn_off).to be_instance_of(String)
			end

			it 'expects status to be OFF' do 
				expect(subject.turn_off).to eq(STATUS_OFF)
			end 

			it 'expects to update status to OFF' do 
				expect(elec_equp.turn_off).to be_equal(STATUS_OFF)
			end   
		end

		context 'check status method' do
			let(:elec_equp) { described_class.new(STATUS_ON, LIGHT_UNITS) }

			it 'expects output not to be nil' do 
				expect(subject.status).not_to be_nil
			end

			it 'expects output as a string' do 
				expect(subject.status).to be_instance_of(String)
			end

			it 'expects status is as provided' do 
				expect(subject.status).to eq(STATUS_ON)
			end 
		end

		context 'power consumption method - given parameters are correct and units being calculated' do
			it 'calculates the power consumption' do
				ee = described_class.new(STATUS_ON, AC_UNITS)
				expect(ee.power_consumption).to eq(AC_UNITS)
			end 

			it 'calculates the power consumption' do
				ee = described_class.new(STATUS_OFF, AC_UNITS)
				expect(ee.power_consumption).to eq(0)
			end	

			it 'raise error if status is missing' do
				expect { described_class.new(AC_UNITS).power_consumption}.to raise_error(ArgumentError)
			end		
		end

	end	

end