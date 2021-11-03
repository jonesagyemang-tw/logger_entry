#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'
require_relative 'parser'
require_relative 'printer'
require_relative 'log_entry'
require_relative 'errors/missing_logfile_error'
require_relative 'errors/file_not_found_error'

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
