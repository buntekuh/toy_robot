# This is the facade
class ScriptRunner
	require 'models/robot.rb'
	require 'models/table.rb'
	require 'models/world.rb'
  require 'models/statement.rb'
	require 'lib/scoped_attr_accessors'	

	private_attr :world

	def initialize
		@world = World.new
		@world.table = Table.new
		@world.robot = Robot.new
	end

	# each statement is executed in turn
	def run_statement line
		Statement.new line, world
	end
end
