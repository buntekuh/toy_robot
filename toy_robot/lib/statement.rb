# This class represents a single line statement
require './toy_robot/lib/scoped_attr_accessors'
require './toy_robot/commands/place_command'
require './toy_robot/commands/move_command'
require './toy_robot/commands/left_command'
require './toy_robot/commands/right_command'
require './toy_robot/commands/report_command'

module ToyRobot
	module Lib
		class Statement
			private_attr_accessor :command, :parameters, :world
				
			def initialize world
				self.world = world
				self.parameters = Array.new
			end
		
			def self.run line, world
				statement = Statement.new world
				statement.run line
			end

			 # parse line and store as command integer and parameters array
			def run line
				self.parameters = line.split(/[,\s]+/)
				cmd = parameters.shift.downcase
				case cmd
					when 'place'
						place
					when 'move'
						move
					when 'left'
						left
					when 'right'
						right
					when 'report'
						report
					else
						failure
				end	
			end

			private

			def place
				if parameters.size != 3
					'error: Please enter x, y, face'
				else
					begin
						::ToyRobot::Commands::PlaceCommand.execute world, *parameters
					nil	
					rescue ToyRobot::Models::Robot::FaceInvalid
						'error: valid directions are NORTH, EAST, SOUTH or WEST'
					rescue ::ToyRobot::Commands::PlaceCommand::CannotPlace
						'error: x and y have to be between 0 and 4'
          rescue ::ToyRobot::Commands::PlaceCommand::XYMustBeNumerical
            'error: x and y have to be numbers'
					end
				end
			end

			def move
				begin
					::ToyRobot::Commands::MoveCommand.execute world
					nil
				rescue ToyRobot::Models::Robot::NotYetPlaced
					'Error: I have not been placed yet'
        rescue ::ToyRobot::Commands::MoveCommand::CannotMove
          nil
				end
			end

      def left
        begin
          ::ToyRobot::Commands::LeftCommand.execute world
          nil
        rescue ToyRobot::Models::Robot::NotYetPlaced
          'Error: I have not been placed yet'
        end
      end

      def right
        begin
          ::ToyRobot::Commands::RightCommand.execute world
          nil
        rescue ToyRobot::Models::Robot::NotYetPlaced
          'Error: I have not been placed yet'
        end
      end

			def report
        begin
          ret = ::ToyRobot::Commands::ReportCommand.execute world
          "#{ret[:x]},#{ret[:y]},#{ret[:face]}" 
        rescue ToyRobot::Models::Robot::NotYetPlaced
          'Error: I have not been placed yet'
        end
			end

			def failure
				'Syntax Error'
			end
		end
	end
end
