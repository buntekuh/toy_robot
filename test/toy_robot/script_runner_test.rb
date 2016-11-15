require 'minitest/autorun'
require './toy_robot/script_runner'
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
  class ScriptRunnerTest < Minitest::Test
		def test_run_statement
			runner = ScriptRunner.new
			runner.run_statement('Place 4, 4, SOUTH')
      assert_equal 4, runner.send(:world).robot.send(:x)
      assert_equal 4, runner.send(:world).robot.send(:y)
      assert_equal 'SOUTH', runner.send(:world).robot.send(:face)

		end

		def test_run_a
			out = ScriptRunner.run 'test/fixtures/a.toyrobot'
			assert_equal File.read('test/fixtures/a.expected_output'), out
		end

    def test_run_b
      out = ScriptRunner.run 'test/fixtures/b.toyrobot'
      assert_equal File.read('test/fixtures/b.expected_output'), out
    end

    def test_run_c
      out = ScriptRunner.run 'test/fixtures/c.toyrobot'
      assert_equal File.read('test/fixtures/c.expected_output'), out
    end
  end
end

