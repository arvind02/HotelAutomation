require_relative '../lib/constants'
require_relative '../lib/hotel'
require_relative '../lib/floor'

RSpec.describe Hotel do
	
	describe 'initialize' do 
		it 'returns a new hotel instance' do 
			hotel = Hotel.new(2,1,2)
			expect(hotel).to be_instance_of(Hotel)
		end

      	it 'throws exception due to missing argument errors' do
        	expect { Hotel.new(2) }.to raise_error(ArgumentError)
      	end

      	it 'contains floor instances' do 
			hotel = Hotel.new(2,1,2)
			expect(hotel.floors.first).to be_instance_of(Floor)
		end
	end 

end