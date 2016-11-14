require 'minitest/autorun'
require './toy_robot/models/table'

module ToyRobot
	module Models
		class TableTest < Minitest::Test
			def test_if_dimensions_are_set
				table = ::ToyRobot::Models::Table.new(999, 100)
				assert_equal 999, table.send(:width)
				assert_equal 100, table.send(:height)
			end

			def test_if_dimensions_are_set_if_none_are_given
				table = ::ToyRobot::Models::Table.new
				assert_equal 5, table.send(:width)
				assert_equal 5, table.send(:height)
			end

			def test_may_goto?
				x = rand(5) + 1
				y = rand(5) + 1
				table = ::ToyRobot::Models::Table.new x, y
				refute table.may_goto?(-1, 1)
				refute table.may_goto?(1, -1)

				refute table.may_goto?(x, 1)
				refute table.may_goto?(1, y)
				refute table.may_goto?(100, 100)
				
				assert table.may_goto?(0, 0)
				assert table.may_goto?(x - 1, y - 1)
			end
		end
	end
end
