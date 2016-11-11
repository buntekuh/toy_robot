# Executes the place command
#
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
  module Commands
    class MoveCommand < BaseCommand
      class CannotMove < StandardError; end
      private_attr_accessor :world

      def initialize world
        self.world = world
      end

      def execute
        new_pos = world.robot.projected_move
        raise CannotMove unless world.table.may_goto? *new_pos
        world.robot.move
      end
    end
  end
end
