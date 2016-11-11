# This class represents a single line statement
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
	module Models
		class Statement
			private_attr_accessor :command, :parameters, :world
				
			def initialize line, world
				self.world = world
				run line
			end
		
			private
			 # parse line and store as command integer and parameters array
			def run line
				self.parameters = line.split(/[,\s]+/)
				cmd = parameters.shift.downcase
				self.command = 	case cmd
												when 'place'
													place
												when 'move'
													move	
												when 'left'
													LEFT
												when 'right'
													left
												when 'report'
													report
												else
													failure
												end	
			end

			def place

			end

			def move

			end

			def left

			end

			def right

			end

			def report

			end

			def failure
				'Syntax Error'
			end
		end
	end
end
