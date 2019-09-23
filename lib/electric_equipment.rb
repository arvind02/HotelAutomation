require_relative './constants.rb'

class ElectricEquipment
	attr_accessor :status, :units

	def initialize(status, units)
		@status = status
		@units = units
	end
	
	def turn_on
		@status = STATUS_ON
	end

	def turn_off
		@status = STATUS_OFF
	end

	def status
		@status
	end

	def power_consumption
		@status == STATUS_ON ? @units : 0
	end

end