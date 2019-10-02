require_relative '../lib/automation_controller'
require_relative '../lib/hotel'

RSpec.describe AutomationController do
	subject { described_class.new(2,1,2) }

	describe 'initialize' do 
		context 'given input parameters is correct' do
			it 'returns a new automation instance' do 
				expect(subject).to be_instance_of(described_class)
			end
		end

		context 'given input paramaters have partial or no parameters' do
          	it 'throws exception due to missing argument errors' do
            	expect { described_class.new(2) }.to raise_error(ArgumentError)
          	end
        end

        context 'after initialize check attributes' do 
        	it 'should have hotel instance as attribute' do 
        		expect(subject).to have_attributes(hotel: be_instance_of(Hotel))
        	end
        end
	end

	describe 'test different methods' do 
		context 'check hotel instance methods' do 
			let(:hotel) { Hotel.new(2,1,2) }
			it 'expects a hotel to do 3 different actions' do
      			expect(hotel).to receive(:current_status).at_most(1).times
      			expect(hotel).to receive(:power_consumption).at_most(1).times
      			expect(hotel).to receive(:track_movement).at_most(1).times
			end
		end

		context 'confirm an object can respond to subject' do
			it 'expects to be instance method of subject' do
			    expect(subject).to respond_to(:status)
			    expect(subject).to respond_to(:power_consumption)
			    expect(subject).to respond_to(:movement)
			end
		end
		
		context 'auto mation controller methods' do 
			it 'expects 3 command methods for automation' do 
				subject.status
				subject.power_consumption
				subject.movement(1,2,false)
			end
		end 
	end
end

