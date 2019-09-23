require_relative './hotel.rb'

class AutomationController
	attr_accessor :hotel
		
	def initialize(floor_count, main_cor_count, sub_cor_count)
		@hotel = Hotel.new(floor_count, main_cor_count, sub_cor_count)
	end

	def status
		@hotel.current_status
	end

	def power_consumption
		@hotel.power_consumption
	end
	
	def movement(floor, subcorridor, move_flag)
		@hotel.track_movement(floor, subcorridor, move_flag)
	end

end