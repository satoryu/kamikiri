# frozen_string_literal: true

module Kamikiri
  module Formatters
    class Base
      attr_reader :out

      def initialize(out)
        @out = out || $stdout
      end
    end
  end
end
