# This is the facade
class ScriptRunner
	require 'models/robot.rb'
	require 'models/table.rb'
  require 'models/statement.rb'
	require 'lib/scoped_attr_accessors'	

	private_attr :robot, :table

	def initialize
		@table = Table.new
		@robot = Robot.new table
	end

	# each statement is executed in turn
	def run_statement line
		statement = Statement.new line, robot
		statement.execute
	end
end
