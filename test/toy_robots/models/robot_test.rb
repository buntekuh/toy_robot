require 'minitest/autorun'
require './toy_robot/models/robot'
require './toy_robot/models/table'


module ToyRobot
  module Models
    class RobotTest < Minitest::Test
			def test_new
				table = Table.new
				robot = Robot.new table
				assert_equal table, robot.send(:table)
			end
		end
	end
end

