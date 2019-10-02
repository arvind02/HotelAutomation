require_relative '../lib/floor'
require_relative '../lib/main_corridor'
require_relative '../lib/sub_corridor'

RSpec.describe Floor do 

	subject { described_class.new(1,1) }

	describe 'initialize' do
		context 'with proper parameters' do
			it 'expect a floor instance' do 
				expect(subject).to be_instance_of(described_class)
			end
		end

		context 'given input paramaters have partial or no parameters' do
          	it 'throws exception due to missing argument errors' do
            	expect { described_class.new(2) }.to raise_error(ArgumentError)
          	end
        end

        context 'after initialize check attributes' do 
        	it 'expects main corridor and main corridor attribute as an array' do 
        		expect(subject).to have_attributes(main_corridor: be_instance_of(Array))
        		expect(subject).to have_attributes(sub_corridor: be_instance_of(Array))
        	end

        	it 'expects main corridor and Sub corridor instances' do 
				expect(subject.main_corridor.first).to be_instance_of(MainCorridor)
				expect(subject.sub_corridor.first).to be_instance_of(SubCorridor)
			end

			it 'validate count of main and sub corridor objects' do 
				expect(subject.main_corridor.size).to be(1)
				expect(subject.sub_corridor.size).to be(1)
			end
        end
	end

	describe 'Different methods behaviour' do 

		context 'confirm an object can respond to subject' do
			it 'expects to be instance method of floor class' do
			    expect(subject).to respond_to(:current_status)
			    expect(subject).to respond_to(:update_power_consumption)
			    expect(subject).to respond_to(:power_consumption)
			    expect(subject).to respond_to(:max_power_limit)
			end
		end
		
		context 'Let\'s call floor class methods' do
			it 'expects working instance methods of floor class' do 
				subject.current_status
				subject.update_power_consumption
				subject.power_consumption
				subject.max_power_limit
			end
		end 

		context 'Check Main Corridor instance methods' do 
			let(:main_corridor) { MainCorridor.new }
			it 'check invoke count of main corridor methods' do
      			expect(main_corridor).to receive(:current_status).at_most(subject.main_corridor.size).times
      			expect(main_corridor).to receive(:power_consumption).at_most(subject.main_corridor.size).times
			end
		end

		context 'Check Sub Corridor instance methods' do 
			let(:sub_corridor) { SubCorridor.new }
			it 'check invoke count of sub corridor methods' do
      			expect(sub_corridor).to receive(:current_status).at_most(subject.sub_corridor.size).times
      			expect(sub_corridor).to receive(:power_consumption).at_most(subject.sub_corridor.size).times
      			expect(sub_corridor).to receive(:turn_on_ac).at_most(subject.sub_corridor.size).times
      			expect(sub_corridor).to receive(:turn_off_ac).at_most(subject.sub_corridor.size).times
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

			it 'expects inclusion of main sub string in output' do 
				expect(subject.current_status).to include('Main')
			end 

			it 'expects inclusion of sub sub string in output' do 
				expect(subject.current_status).to include('Sub')
			end  
		end

		context 'Update power consumption output' do 
			it 'expects output not to be empty or instance of string' do 
				expect(subject.update_power_consumption).to be_nil.or be_instance_of(String)
			end
		end

		context 'Power consumption output' do 
			it 'expects output not to be empty' do 
				expect(subject.power_consumption).not_to be_nil
			end

			it 'expects output as a integer' do 
				expect(subject.power_consumption).to be_instance_of(Integer)
			end
		end

		context 'Max power limit output' do 
			it 'expects output not to be empty' do 
				expect(subject.max_power_limit).not_to be_nil
			end

			it 'expects output as a integer' do 
				expect(subject.max_power_limit).to be_instance_of(Integer)
			end

			it 'expect the total based on main_corridor and sub_corridor' do 
				expect(subject.max_power_limit).to be_equal(subject.main_corridor.size * 15 + subject.sub_corridor.size * 10)
			end
		end

	end
end