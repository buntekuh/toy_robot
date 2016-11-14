# This is the facade
module ToyRobot
	class ScriptRunner
		require './toy_robot/models/robot'
		require './toy_robot/models/table'
		require './toy_robot/models/world'
	  require './toy_robot/lib/statement'
		require './toy_robot/lib/scoped_attr_accessors'	
	
		private_attr_accessor :world
	
		def initialize
			self.world = ScriptRunner.createWorld
		end
	
		# each statement is executed in turn
		def run_statement line
			 ToyRobot::Lib::Statement.run line.strip, world
		end
	
		def self.run filename
			out = ''
		  world =  ScriptRunner.createWorld
			File.open(filename).each do |line|
	    	out << ToyRobot::Lib::Statement.run(line.strip, world)
				out << "\n"
			end
			out
		end
	 
		private
	
		def self.createWorld
	    world = ToyRobot::Models::World.new
	    world.table = ToyRobot::Models::Table.new
	    world.robot = ToyRobot::Models::Robot.new
			world
		end
	end
end
