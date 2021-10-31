#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'errors/missing_logfile_error'

raise MissingLogFileError, 'Missing log file' if ARGV.empty?
