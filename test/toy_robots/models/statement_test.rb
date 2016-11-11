require 'minitest/autorun'
require './toy_robot/models/robot'
require './toy_robot/models/table'
require './toy_robot/models/statement'

module ToyRobot
  module Models
    class StatementTest < Minitest::Test
      def test_new
				table = Table.new
				robot = Robot.new(table)
				
				statement = Statement.new 'a 1, 2, 3', robot
				assert_equal Statement::UNDEFINED, statement.send(:command)
				assert_equal robot, statement.send(:robot)
				#assert_equal  ['1', '2', '3'], statement.send(:parameters)

				assert_equal Statement::PLACE, Statement.new('PLACE X,Y,F', robot).send(:command)
				a = rand(10)
				b = rand(10)
				c = rand(10)
			 	assert_equal [a.to_s, b.to_s, c.to_s], Statement.new("PLACE #{a},#{b},#{c}", robot).send(:parameters)
				assert_equal Statement::PLACE, Statement.new('PLACE X,Y,F', robot).send(:command)
				assert_equal Statement::MOVE, Statement.new('MOVE', robot).send(:command)
				assert_equal Statement::LEFT, Statement.new('LEFT', robot).send(:command)
				assert_equal Statement::RIGHT, Statement.new('RIGHT', robot).send(:command)
				assert_equal Statement::REPORT, Statement.new('REPORT', robot).send(:command)
      end

    end
  end
end
