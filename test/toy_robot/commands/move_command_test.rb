require 'minitest/autorun'
require './toy_robot/commands/base_command'
require './toy_robot/commands/move_command'
require './toy_robot/models/world'
require './toy_robot/models/table'
require './toy_robot/models/robot'

module ToyRobot
  module Commands
    class MoveCommandTest < Minitest::Test
      def setup
        @world = ::ToyRobot::Models::World.new
        @world.robot = ::ToyRobot::Models::Robot.new
        @world.table = ::ToyRobot::Models::Table.new
      end

      def test_execute
        @world.robot.place '3', '3', 'NORTH'
        MoveCommand.execute @world
        assert_equal 3, @world.robot.send(:x)
        assert_equal 4, @world.robot.send(:y)
      end

      def test_execute_fails_if_robot_has_not_yet_been_placed
        assert_raises (ToyRobot::Models::Robot::NotYetPlaced) do
          MoveCommand.execute @world
        end
      end

      def test_execute_fails_if_robot_would_fall_off_the_table
        @world.robot.place '4', '4', 'NORTH'
        assert_raises (MoveCommand::CannotMove) do
          MoveCommand.execute @world
        end
      end
    end
  end
end
