require_relative './main_corridor.rb'
require_relative './sub_corridor.rb'

class Floor
	attr_accessor :main_corridor, :sub_corridor

	def initialize(main_cor_count, sub_cor_count)
		@main_corridor = []
		@sub_corridor = []
		main_cor_count.times do 
			@main_corridor << MainCorridor.new
		end
		sub_cor_count.times do 
			@sub_corridor << SubCorridor.new
		end
	end

	def current_status
		status = ''
		@main_corridor.each.with_index(1) do |mc, i|
			status << "Main corridor #{i}" << " " << mc.current_status(i)
		end

		@sub_corridor.each.with_index(1) do |sc, i|
			status << "\n"
			status << "Sub corridor #{i}" << " " << sc.current_status(i)
		end
		return status
	end

	def update_power_consumption
		if power_consumption == max_power_limit
			puts "Power Consumption is under Power Limit"
		elsif power_consumption < max_power_limit
			@sub_corridor.each do |sc|
				sc.turn_on_ac
			end
		else
			@sub_corridor.each do |sc|
				sc.turn_off_ac
				break if power_consumption <= max_power_limit
			end
		end
	end

	def power_consumption
		total_pc = 0
		@main_corridor.each do |mc|
			total_pc += mc.power_consumption
		end

		@sub_corridor.each do |sc|
			total_pc += sc.power_consumption
		end
	  return total_pc
	end

	def max_power_limit #per floor
		return @main_corridor.size * 15 + @sub_corridor.size * 10
	end

end