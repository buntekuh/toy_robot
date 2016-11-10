require './toy_robot/lib/scoped_attr_accessors'
require './toy_robot/models/table'

# This the model that stores the robot state
module ToyRobot
	module Models
		class Robot
			private_attr_accessor :x, :y, :face, :table
		
			def initialize table
				self.table = table
			end
		
			# TODO Implement methods for turn move, etc.
		
		end
	end
end
