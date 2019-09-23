require_relative './floor.rb'

class Hotel
 	attr_accessor :floors

	def initialize(floor_count, main_cor_count, sub_cor_count)
		@floors = []
		floor_count.times do 
			@floors << Floor.new(main_cor_count, sub_cor_count)
		end
	end

	def current_status
		status = ''
		@floors.each.with_index(1) do |floor, i|
			status << "\n------------------Floor #{i}-------------------\n"
			status << floor.current_status
			status << "\n"
		end
		return status
	end

	def power_consumption
		total_pc = 0 
		@floors.each do |floor|
			total_pc += floor.power_consumption
		end
		return "Total Power Consumption in Hotel - #{total_pc} units"
	end

	def track_movement(floor, subcorridor, move_flag)
		current_floor = @floors[floor - 1]
		current_subcorridor = current_floor.sub_corridor[subcorridor -1]
			
		if move_flag
			current_subcorridor.turn_on_lights
		else
			current_subcorridor.turn_off_lights
		end
		current_floor.update_power_consumption
	end

end