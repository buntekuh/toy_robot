require 'minitest/autorun'
require './toy_robot/commands/base_command'
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
  module Commands
    class TestCommand < BaseCommand
      private_attr_accessor :arg

      def initialize arg
        self.arg = arg
      end

      def execute
        arg.to_s
      end
    end

    class BaseCommandTest < Minitest::Test
      def test_execute
        assert_raises(RuntimeError) do
          BaseCommand.execute
        end

        assert_equal '1', TestCommand.execute(1)
      end
    end
  end
end
