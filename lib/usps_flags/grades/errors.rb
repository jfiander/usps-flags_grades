# frozen_string_literal: true

# Custom errors.
#
# @private
module USPSFlags::Errors
  class USPSFlags::Errors::InvalidInsignia < StandardError
    def initialize(msg = 'You have specified invalid insignia.')
      super(msg)
    end
  end
end
