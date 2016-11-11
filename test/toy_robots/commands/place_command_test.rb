require 'minitest/autorun'
require './toy_robot/commands/base_command'
require './toy_robot/commands/place_command'
require './toy_robot/models/world'
require './toy_robot/models/table'
require './toy_robot/models/robot'

module ToyRobot
  module Commands
    class PlaceCommandTest < Minitest::Test
      def setup
        @world = ::ToyRobot::Models::World.new
        @world.robot = ::ToyRobot::Models::Robot.new
        @world.table = ::ToyRobot::Models::Table.new
      end

      def test_execute
        PlaceCommand.execute @world, '3', '4', 'NORTH'
        assert_equal 3, @world.robot.send(:x)
        assert_equal 4, @world.robot.send(:y)
        assert_equal 'NORTH', @world.robot.send(:face)
      end

      def test_execute_fails_if_face_is_invalid
        assert_raises (ToyRobot::Models::Robot::FaceInvalid) do
          PlaceCommand.execute @world, '3', '4', 'Blumm'
        end
      end

      def test_execute_fails_if_position_is_not_on_table
        assert_raises (PlaceCommand::CannotPlace) do
          PlaceCommand.execute @world, '6', '6', 'NORTH'
        end
      end
    end
  end
end
