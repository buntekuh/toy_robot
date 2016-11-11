# Command implementations should inherit from abstract BaseCommand
#
module ToyRobot
  module Commands
    class BaseCommand
      #
      # Execute perfoms the command
      # this is a helper method that instantiates the command object
      # and calls execute on the command implementation
      # @param *args The arguments to be passed to the command implementations inititalize method
      #
      # @return whatever the command implementation execute method returns
      def self.execute(*args)
        new(*args).execute
      end

      #
      # Command implementations should implement their own execute method
      #
      # @fails always
      def execute
        fail 'Please implement execute method'
      end
    end
  end
end
