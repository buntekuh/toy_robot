# Executes the place command
#
require './toy_robot/lib/scoped_attr_accessors'

module ToyRobot
  module Commands
    class PlaceCommand < BaseCommand
      class CannotPlace < StandardError; end
      private_attr_accessor :world, :x, :y, :face

      def initialize world, x, y, face
        self.world = world
        self.x = x.to_i
        self.y = y.to_i
        self.face = face
      end

      def execute
        raise CannotPlace unless world.table.may_goto? x, y
        world.robot.place x, y, face
      end
    end
  end
end
