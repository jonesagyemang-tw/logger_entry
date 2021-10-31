#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'errors/missing_logfile_error'
require_relative 'errors/file_not_found_error'

raise MissingLogFileError, 'Missing log file' if ARGV.empty?
raise FileNotFoundError, 'Log file not found' unless File.exist?(ARGV[0])
