#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'
require_relative 'parser'
require_relative 'log_entry'
require_relative 'errors/missing_logfile_error'
require_relative 'errors/file_not_found_error'

file_name = ARGV[0]
raise MissingLogFileError, 'Missing log file' if ARGV.empty?
raise FileNotFoundError, 'Log file not found' unless File.exist?(file_name)

Parser.new(file: file_name).run
