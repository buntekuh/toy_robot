# This class represents a single line statement
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
	module Models
		class Statement
			private_attr_accessor :command, :parameters, :world
		
			UNDEFINED = 1
			PLACE 		= 2
			MOVE			= 3
			LEFT			= 4
			RIGHT			= 5
			REPORT		= 6
		
			def initialize line, world
				self.world = world
				parse line
			end
		
			def execute
				# call method on robot
			end

			private
			 # parse line and store as command integer and parameters array
			def parse line
				self.parameters = line.split(/[,\s]+/)
				cmd = parameters.shift.downcase
				self.command = 	case cmd
												when 'place'
													PLACE
												when 'move'
													MOVE	
												when 'left'
													LEFT
												when 'right'
													RIGHT
												when 'report'
													REPORT
												else
													UNDEFINED
												end	
			end
		end
	end
end
