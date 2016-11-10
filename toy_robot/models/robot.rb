# This the model that stores the robot state
def Robot
	require 'lib/scoped_attr_accessors'

	private_attr :x, :y, :face, :table

	def initialize table
		@table = table
	end

	# TODO Implement methods for turn move, etc.

end
