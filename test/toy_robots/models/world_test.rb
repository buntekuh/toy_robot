require 'minitest/autorun'

require './toy_robot/models/world'
require './toy_robot/models/table'
require './toy_robot/models/robot'

module ToyRobot
  module Models
    class WorldTest < Minitest::Test
      def test_setting_attributes
        table = Table.new
        robot = Robot.new
        world = World.new

        world.table = table
        assert_equal table, world.table
        
        world.robot = robot
        assert_equal robot, world.robot
      end
    end
  end
end
