# frozen_string_literal: true

require 'kamikiri/formatters'

module Kamikiri
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
        parser.on('--formatter FORMATTER') { |v| v }
        parser.parse!(argv, into: options)

        options
      end
    end

    def initialize(options)
      @file = options[:file]
      @xpath = options[:xpath]
      @formatter_name = options[:formatter] || :default
    end

    def run
      require 'nokogiri'
      require 'open-uri'

      content = open(@file).read
      doc = Nokogiri.XML(content)
      nodes = doc.xpath(@xpath)

      formatter = load_formatter
      formatter.format(nodes)
    end

    private

    def load_formatter
      formatter_class = Formatters.load(@formatter_name)
      formatter_class.new($stdout)
    end
  end
end
