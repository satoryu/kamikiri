# frozen_string_literal: true

module Kaminari
  class Cli
    class << self
      def run(argv)
        options = parse_options(argv)
        new(options).run
      end

      private

      def parse_options(argv)
        require 'optparse'

        options = {}
        parser = OptionParser.new
        parser.on('-f FILE', '--file FILE') { |v| v }
        parser.on('--xpath XPATH') { |v| v }
        parser.parse!(argv, into: options)

        options
      end
    end

    def initialize(options)
      @file = options[:file]
      @xpath = options[:xpath]
    end

    def run
      require 'nokogiri'
      require 'open-uri'

      content = open(@file).read
      doc = Nokogiri.XML(content)
      nodes = doc.xpath(@xpath)

      nodes.each do |node|
        puts node.to_s
      end
    end
  end
end
