require 'minitest/autorun'
require './toy_robot/models/robot'
require './toy_robot/models/table'
require './toy_robot/models/statement'

module ToyRobot
  module Models
    class StatementTest < Minitest::Test
      def test_new
				world = World.new
        world.robot = Robot.new
        world.table = Table.new
				
				statement = Statement.new 'a 1, 2, 3', world
				assert_equal Statement::UNDEFINED, statement.send(:command)
				assert_equal world, statement.send(:world)
				#assert_equal  ['1', '2', '3'], statement.send(:parameters)

				assert_equal Statement::PLACE, Statement.new('PLACE X,Y,F', world).send(:command)
				a = rand(10)
				b = rand(10)
				c = rand(10)
			 	assert_equal [a.to_s, b.to_s, c.to_s], Statement.new("PLACE #{a},#{b},#{c}", world).send(:parameters)
				assert_equal Statement::PLACE, Statement.new('PLACE X,Y,F', world).send(:command)
				assert_equal Statement::MOVE, Statement.new('MOVE', world).send(:command)
				assert_equal Statement::LEFT, Statement.new('LEFT', world).send(:command)
				assert_equal Statement::RIGHT, Statement.new('RIGHT', world).send(:command)
				assert_equal Statement::REPORT, Statement.new('REPORT', world).send(:command)
      end

    end
  end
end
