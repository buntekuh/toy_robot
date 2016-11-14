require 'minitest/autorun'
require './toy_robot/models/robot'
require './toy_robot/models/table'
require './toy_robot/models/world'
require './toy_robot/models/statement'

module ToyRobot
  module Models
    class StatementTest < Minitest::Test
			def setup
        @world = World.new
        @world.robot = Robot.new
        @world.table = Table.new
			end
      def test_new
				statement = Statement.new @world
				assert_equal @world, statement.send(:world)
      end
 			
			def test_place
				assert_equal  "I'm ready", Statement.run('PLACE 1, 2, NORTH', @world)
			
        assert_equal 1, @world.robot.send(:x)
        assert_equal 2, @world.robot.send(:y)
				assert_equal 'NORTH', @world.robot.send(:face)
 			end
 			
			def test_place_fails_unless_3_params
				assert_equal 'error: Please enter x, y, face', Statement.run('Place', @world)
				assert_equal 'error: Please enter x, y, face', Statement.run('Place, 1, 2, NORTH, 8', @world)
			end

      def test_place_fails_if_face_is_invalid
        assert_equal 'error: valid directions are NORTH, EAST, SOUTH or WEST', Statement.run('Place, 1, 2, BLUMM', @world)
			end

      def test_place_fails_if_cannot_place_robot
        assert_equal 'error: x and y have to be between 0 and 4', Statement.run('Place, 5, 5, NORTH', @world)
      end

      def test_place_fails_if_x_or_y_are_not_numerical
        assert_equal 'error: x and y have to be numbers', Statement.run('Place, 1x, 2, NORTH', @world)
				assert_equal 'error: x and y have to be numbers', Statement.run('Place, x, 2y, NORTH', @world)
      end


			def test_move
				Statement.run('Place, 1, 2, NORTH', @world)
				assert_equal 'Moving', Statement.run('MOVE', @world)		
			end

      def test_move_fails_unless_placed
        assert_equal 'Error: I have not been placed yet', Statement.run('MOVE', @world)
      end

      def test_move_fails_if_cannot_move
				Statement.run('Place, 2, 4, NORTH', @world)
        assert_equal "I'm afraid to fall", Statement.run('MOVE', @world)
      end


      def test_left
        Statement.run('Place, 1, 2, NORTH', @world)
        assert_equal 'Turning left', Statement.run('LEFT', @world)
      end

      def test_left_fails_unless_placed
        assert_equal 'Error: I have not been placed yet', Statement.run('LEFT', @world)
      end

      def test_right
        Statement.run('Place, 1, 2, NORTH', @world)
        assert_equal 'Turning right', Statement.run('RIGHT', @world)
      end

      def test_right_fails_unless_placed
        assert_equal 'Error: I have not been placed yet', Statement.run('RIGHT', @world)
      end

      def test_report
        Statement.run('Place, 1, 2, NORTH', @world)
        assert_equal 'I am at 1, 2 facing North', Statement.run('Report', @world)
      end

      def test_report_fails_unless_placed
        assert_equal 'Error: I have not been placed yet', Statement.run('Report', @world)
      end

			def test_fails_if_no_valid_command
				assert_equal 'Syntax Error', Statement.run('Foo Bar', @world)
			end

    end
  end
end
