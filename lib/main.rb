#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'
require_relative 'log_entry'
require_relative 'errors/missing_logfile_error'
require_relative 'errors/file_not_found_error'

raise MissingLogFileError, 'Missing log file' if ARGV.empty?
raise FileNotFoundError, 'Log file not found' unless File.exist?(ARGV[0])

entries = []
File.foreach(ARGV[0]) do |entry|
  uri, ip_address = entry.split ' '
  log_entry = LogEntry.new(uri: uri, ip_address: ip_address)
  entries << log_entry if log_entry.valid?
end

results = entries.group_by(&:uri)
                 .sort_by { |_, value| value.count }
                 .reverse
                 .to_h

def print_page_views(results)
  results.each do |key, value|
    puts "#{key} #{value.count} visits"
  end
end

def print_unique_page_views(results)
  results.each do |key, value|
    puts "#{key} #{value.uniq(&:ip_address).count} unique visits"
  end
end

print_page_views(results)
print_unique_page_views(results)
