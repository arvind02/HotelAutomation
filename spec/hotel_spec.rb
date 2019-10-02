require_relative '../lib/constants'
require_relative '../lib/hotel'
require_relative '../lib/floor'

RSpec.describe Hotel do

	subject { described_class.new(2,1,2) }

	describe 'initialize' do
		context 'with porper parameters' do
			it 'expect a hotel instance' do 
				expect(subject).to be_instance_of(described_class)
			end
		end

		context 'given input paramaters have partial or no parameters' do
          	it 'throws exception due to missing argument errors' do
            	expect { described_class.new(2) }.to raise_error(ArgumentError)
          	end
        end

        context 'after initialize check attributes' do 
        	it 'expects floor attribute as an array' do 
        		expect(subject).to have_attributes(floors: be_instance_of(Array))
        	end

        	it 'expects floor instances' do 
				expect(subject.floors.first).to be_instance_of(Floor)
			end
        end
	end

	describe 'test different methods' do 
		context 'check floor instance methods' do 
			let(:floor) { Floor.new(1,2) }
			it 'expects a floor to do different actions based on hotels floor count' do
      			expect(floor).to receive(:current_status).at_most(subject.floors.count).times
      			expect(floor).to receive(:power_consumption).at_most(subject.floors.count).times
      			expect(floor).to receive(:update_power_consumption).at_most(1).times
			end
		end

		context 'confirm an object can respond to subject' do
			it 'expects to be instance method of subject' do
			    expect(subject).to respond_to(:current_status)
			    expect(subject).to respond_to(:power_consumption)
			    expect(subject).to respond_to(:track_movement)
			end
		end
		
		context 'Class Hotel to should have these methods' do 
			it 'expects 3 instance methods for class hotel' do 
				subject.current_status
				subject.power_consumption
				subject.track_movement(1,2,false)
			end
		end 
	end 

	describe 'Individual methods Behaviour' do
		context 'Check current status method' do 
			it 'expects output not to be empty' do 
				expect(subject.current_status).not_to be_empty
			end

			it 'expects output as a string' do 
				expect(subject.current_status).to be_instance_of(String)
			end

			it 'expects inclusion of floor in output' do 
				expect(subject.current_status).to include('Floor')
			end  
		end

		context 'Check power consumption output' do 
			it 'expects output not to be empty' do 
				expect(subject.power_consumption).not_to be_empty
			end

			it 'expects output as a string' do 
				expect(subject.power_consumption).to be_instance_of(String)
			end

			it 'should check for substring at the beginning and end' do
		      	expect(subject.power_consumption).to start_with('Total')
		      	expect(subject.power_consumption).to end_with('units')
		    end
		end

		context 'Track movement' do 
			it 'throws exception due to missing argument' do 
		      	expect { subject.track_movement }.to raise_error(ArgumentError)
			end

			it 'should not return anything with correct arguments' do 
		      	expect(subject.track_movement(1,2,true)).to be_nil
			end
		end

	end


end