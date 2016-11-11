require 'minitest/autorun'
require './toy_robot/commands/base_command'
require './toy_robot/commands/left_command'
require './toy_robot/models/world'
require './toy_robot/models/table'
require './toy_robot/models/robot'

module ToyRobot
  module Commands
    class LeftCommandTest < Minitest::Test
      def setup
        @world = ::ToyRobot::Models::World.new
        @world.robot = ::ToyRobot::Models::Robot.new
        @world.table = ::ToyRobot::Models::Table.new
      end

      def test_execute
        @world.robot.place '3', '3', 'NORTH'
        LeftCommand.execute @world
        assert_equal 'WEST', @world.robot.send(:face)
      end

      def test_execute_fails_if_robot_has_not_been_placed
        assert_raises (ToyRobot::Models::Robot::NotYetPlaced) do
          LeftCommand.execute @world
        end
      end
    end
  end
end
