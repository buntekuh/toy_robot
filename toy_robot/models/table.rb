# Represents the board on which the robot roams
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
	module Models
		class Table
			private_attr_accessor :width, :height
		
			def initialize width = 5, height = 5
				# set width and height
				self.width = width
				self.height = height
			end
		
			# return wether position is within bounds
			def may_goto? x, y
				(0...width).include?(x) && (0...height).include?(y)
			end
		end
	end
end
