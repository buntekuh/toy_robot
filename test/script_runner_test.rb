require 'minitest/autorun'
require './toy_robot/script_runner'
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
  class ScriptRunnerTest < Minitest::Test
		def test_run_statement
			runner = ScriptRunner.new
			assert_equal "I'm ready", runner.run_statement('Place 4, 4, SOUTH')
		end

    def test_run
			out = ScriptRunner.run 'test/fixtures/program.toyrobot'
			assert_equal File.read('test/fixtures/program.expected_output'), out
     end
  end
end

