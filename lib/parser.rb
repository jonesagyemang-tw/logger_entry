#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'
require_relative 'errors/missing_logfile_error'
require_relative 'errors/file_not_found_error'

raise MissingLogFileError, 'Missing log file' if ARGV.empty?
raise FileNotFoundError, 'Log file not found' unless File.exist?(ARGV[0])

# /about/2 543.910.244.929
# /help_page/1 200.017.277.774
# /home 126.318.035.038
# /about/2 184.123.665.067
# /home 451.106.204.921

# class to handle log entries from any given server log file
class LogEntry
  attr_reader :uri

  def initialize(uri:, ip_address:)
    @uri = uri
    @ip_address = ip_address
  end
end

entries = []
File.foreach(ARGV[0]) do |entry|
  uri, ip_address = entry.split ' '
  entries << LogEntry.new(uri: uri, ip_address: ip_address)
end

entries.group_by(&:uri)
       .sort_by { |_, value| value.count }
       .reverse
       .to_h
       .each { |key, value| print "#{key} #{value.count} visits " }
