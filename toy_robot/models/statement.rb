# This class represents a single line statement
class Statement
	require 'lib/scoped_attr_accessors'

	
	:private_attr :comamnd, :parameters, :robot

	UNDEFINED = 1
	PLACEMENT = 2
	MOVE			= 3
	LEFT			= 4
	RIGHT			= 5
	REPORT		= 6

	def initialize line, robot
		# parse line and store as command integer and 
	end

	def execute
		# call method on robot
	end
end
