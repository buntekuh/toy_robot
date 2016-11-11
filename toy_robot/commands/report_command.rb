# Executes the report command
#
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
  module Commands
    class ReportCommand < BaseCommand
      private_attr_accessor :world

      def initialize world
        self.world = world
      end

      def execute
        world.robot.report
      end
    end
  end
end
