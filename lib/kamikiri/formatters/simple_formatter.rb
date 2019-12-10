# frozen_string_literal: true

require 'kamikiri/formatters/base'

module Kamikiri
  module Formatters
    class SimpleFormatter < Base
      def format(nodes)
        nodes.each do |node|
          out.puts node.to_s
        end
      end
    end

    register :default, SimpleFormatter
    register :simple, SimpleFormatter
  end
end