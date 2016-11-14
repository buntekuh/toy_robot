# Executes the place command
#
require './toy_robot/lib/scoped_attr_accessors'
require './toy_robot/commands/base_command'

module ToyRobot
  module Commands
    class PlaceCommand < BaseCommand
      class CannotPlace < StandardError; end
			class XYMustBeNumerical < StandardError; end
      private_attr_accessor :world, :x, :y, :face

      def initialize world, x, y, face
        self.world = world
        self.x = x
        self.y = y
        self.face = face.upcase
      end

      def execute
				test_numericality_of_x_and_y
				test_if_robot_can_be_placed
				place
      end

			private

			def test_numericality_of_x_and_y
        raise XYMustBeNumerical if (x =~ /^[0-9]+$/).nil? || (y =~ /^[0-9]+$/).nil?
        self.x = x.to_i
        self.y = y.to_i
			end

			def test_if_robot_can_be_placed
				raise CannotPlace unless world.table.may_goto? x, y
			end

			def place
				 world.robot.place x, y, face
			end
    end
  end
end
