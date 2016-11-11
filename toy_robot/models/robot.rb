require './toy_robot/lib/scoped_attr_accessors'

# This the model that stores the robot state
module ToyRobot
	module Models
		class Robot
			class NotYetPlaced < StandardError; end
			class FaceInvalid < StandardError; end

			DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']
			
			private_attr_accessor :x, :y, :face, :been_placed
		
			def initialize
				self.been_placed = nil
			end
		
			def place x, y, face
				raise FaceInvalid unless DIRECTIONS.include? face
				self.x = x.to_i
				self.y = y.to_i
				self.face = face
				self.been_placed = true
			end

			def move
				self.x, self.y = projected_move
			end

			# 
			# Returns where the robot would move to if it did
			# 
			def projected_move
				raise NotYetPlaced if been_placed.nil?

				_x = x
				_y = y
				case face
				when 'NORTH'
					_y += 1
				when 'EAST'
					_x += 1					
				when 'SOUTH'
					_y -= 1
				when 'WEST'
					_x -= 1					
				end
				[_x, _y]
			end

			def turn_left
				raise NotYetPlaced if been_placed.nil?
				index = DIRECTIONS.index(face)
				self.face = DIRECTIONS.rotate(-1)[index]
			end

			def turn_right
				raise NotYetPlaced if been_placed.nil?
				index = DIRECTIONS.index(face)
				self.face = DIRECTIONS.rotate(1)[index]
			end

			def report
				raise NotYetPlaced if been_placed.nil?
				{ x: x, y: y, face: face }
			end
		
		end
	end
end
