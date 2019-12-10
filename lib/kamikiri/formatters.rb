# frozen_string_literal: true

module Kamikiri
  module Formatters
    class << self
      def register(name, formatter_class)
        @formatters ||= {}
        @formatters[name.to_sym] = formatter_class
      end

      def load(name)
        @formatters[name.to_sym]
      end
    end
  end
end

require 'kamikiri/formatters/simple_formatter'