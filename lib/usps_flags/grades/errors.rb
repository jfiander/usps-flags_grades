# frozen_string_literal: true

# Custom errors.
#
# @private
class USPSFlags
  class Errors
    class InvalidInsignia < StandardError
      def initialize(msg = 'You have specified invalid insignia.')
        super(msg)
      end
    end
  end
end
