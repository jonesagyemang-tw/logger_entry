#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../support/env'

file_name = ARGV[0]
raise MissingLogFileError, 'Missing log file' if ARGV.empty?
raise FileNotFoundError, 'Log file not found' unless File.exist?(file_name)

parser = Parser.new(file: file_name)
parser.run

printer = Printer.new(page_views: parser.results)

puts 'Page Views'
20.times { print '*' }
puts ''
printer.print_page_views
puts ''

puts 'Unique Page Views'
20.times { print '*' }
puts ''
printer.print_unique_page_views
