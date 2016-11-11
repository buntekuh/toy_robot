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
				raise NotYetPlaced if been_placed.nil?
				case face
				when 'NORTH'
					self.y += 1
				when 'EAST'
					self.x += 1					
				when 'SOUTH'
					self.y -= 1
				when 'WEST'
					self.x -= 1					
				end
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
