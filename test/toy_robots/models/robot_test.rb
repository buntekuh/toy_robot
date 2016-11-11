require 'minitest/autorun'
require './toy_robot/models/robot'


module ToyRobot
  module Models
    class RobotTest < Minitest::Test
			def setup
        @robot = Robot.new
      end

      def test_place
        @robot.place '3', '4', 'NORTH'
        assert_equal 3, @robot.send(:x)
        assert_equal 4, @robot.send(:y)
        assert_equal 'NORTH', @robot.send(:face)
      end

      def test_place_fails_if_face_invalid
        assert_raises(Robot::FaceInvalid) do
          @robot.place '3', '4', 'BLUMM'
        end
      end

      def test_move_fails_if_robot_not_placed
        assert_raises(Robot::NotYetPlaced) do
          @robot.move
        end
      end

       def test_move_north
         @robot.place '3', '4', 'NORTH'
         @robot.move
         assert_equal 3, @robot.send(:x)
         assert_equal 5, @robot.send(:y)        
       end

       def test_move_east
         @robot.place '3', '4', 'EAST'
         @robot.move
         assert_equal 4, @robot.send(:x)
         assert_equal 4, @robot.send(:y)        
       end

       def test_move_south
         @robot.place '3', '4', 'SOUTH'
         @robot.move
         assert_equal 3, @robot.send(:x)
         assert_equal 3, @robot.send(:y)        
      end

       def test_move_west
         @robot.place '3', '4', 'WEST'
         @robot.move
         assert_equal 2, @robot.send(:x)
         assert_equal 4, @robot.send(:y)        
       end


       def test_turn_left_fails_if_robot_not_placed
         assert_raises(Robot::NotYetPlaced) do
           @robot.turn_left
         end
       end

       def test_turn_left_when_facing_north
         @robot.place '3', '4', 'NORTH'
         @robot.turn_left
         assert_equal 'WEST', @robot.send(:face)
      end
       
       def test_turn_left_when_facing_east
         @robot.place '3', '4', 'EAST'
         @robot.turn_left
         assert_equal 'NORTH', @robot.send(:face)
       end
       
       def test_turn_left_when_facing_south
         @robot.place '3', '4', 'SOUTH'
         @robot.turn_left
         assert_equal 'EAST', @robot.send(:face)
       end
       
       def test_turn_left_when_facing_west
         @robot.place '3', '4', 'WEST'
         @robot.turn_left
         assert_equal 'SOUTH', @robot.send(:face)
       end


        def test_turn_right_fails_if_robot_not_placed
          assert_raises(Robot::NotYetPlaced) do
            @robot.turn_right
          end
        end

        def test_turn_right_when_facing_north
          @robot.place '3', '4', 'NORTH'
          @robot.turn_right
          assert_equal 'EAST', @robot.send(:face)
       end
        
        def test_turn_right_when_facing_east
          @robot.place '3', '4', 'EAST'
          @robot.turn_right
          assert_equal 'SOUTH', @robot.send(:face)
        end
        
        def test_turn_right_when_facing_south
          @robot.place '3', '4', 'SOUTH'
          @robot.turn_right
          assert_equal 'WEST', @robot.send(:face)
        end
        
        def test_turn_right_when_facing_west
          @robot.place '3', '4', 'WEST'
          @robot.turn_right
          assert_equal 'NORTH', @robot.send(:face)
        end

        def test_report_fails_if_not_placed
          assert_raises(Robot::NotYetPlaced) do
            @robot.report
          end
        end

        def test_report
          @robot.place '3', '4', 'NORTH'
          assert_equal({x: 3, y: 4, face: 'NORTH'}, @robot.report)
        end
		end
	end
end

