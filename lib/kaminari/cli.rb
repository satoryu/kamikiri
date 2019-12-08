# frozen_string_literal: true

module Kaminari
  class Cli
    def self.run(argv)
      options = parse_options(argv)
      new(options).run
    end

    def initialize(options)
      @file = options[:file]
      @xpath = options[:xpath]
    end

    def run
      require 'nokogiri'

      content = File.read(@file)
      doc = Nokogiri.XML(content)
      nodes = doc.xpath(@xpath)

      nodes.each do |node|
        puts node.to_s
      end
    end

    private

    def self.parse_options(argv)
      require 'optparse'

      options = {}
      parser = OptionParser.new
      parser.on('-f FILE', '--file FILE') { |v| v }
      parser.on('--xpath XPATH') { |v| v }
      parser.parse!(argv, into: options)

      options
    end
  end
end