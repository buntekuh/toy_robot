# Represents the board on which the robot roams
class Table
	:private_attr :width, :height

	def initialize width = 5, height = 5
		# set width and height
	end

	# return wether position is within bounds
	def may_goto? x, y
	end
end
