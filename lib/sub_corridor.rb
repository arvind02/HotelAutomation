require_relative './electric_equipment.rb'
require_relative './constants.rb'

class SubCorridor
	attr_accessor :light, :air_conditioner

	def initialize
		@light = ElectricEquipment.new(STATUS_OFF, LIGHT_UNITS)
		@air_conditioner = ElectricEquipment.new(STATUS_ON, AC_UNITS)
	end

	def current_status(count)
		status = ''
		status << " Light #{count} : #{@light.status}  AC :  #{@air_conditioner.status}"
		return status
	end

	def turn_on_lights
		@light.turn_on
	end

	def turn_off_lights
		@light.turn_off
	end

	def turn_on_ac
		@air_conditioner.turn_on
	end

	def turn_off_ac
		@air_conditioner.turn_off
	end

	def power_consumption
		return @light.power_consumption + @air_conditioner.power_consumption
	end

end
