# Executes the right command
#
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
  module Commands
    class RightCommand < BaseCommand
      private_attr_accessor :world

      def initialize world
        self.world = world
      end

      def execute
        world.robot.turn_right
      end
    end
  end
end
