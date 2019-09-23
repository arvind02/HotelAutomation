require_relative './electric_equipment.rb'
require_relative './constants.rb'

class MainCorridor
	attr_accessor :light, :air_conditioner

	def initialize
		@light = ElectricEquipment.new(STATUS_ON, LIGHT_UNITS)
		@air_conditioner = ElectricEquipment.new(STATUS_ON, AC_UNITS)
	end

	def current_status(count)
		status = ''
		status << " Light #{count} : #{@light.status}  AC :  #{@air_conditioner.status}"
		return status
	end

	def power_consumption
		return @light.power_consumption + @air_conditioner.power_consumption
	end

end
