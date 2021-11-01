#!/usr/bin/env ruby
# frozen_string_literal: true

# class to handle log entries from any given server log file
class LogEntry
  attr_reader :uri, :ip_address

  def initialize(uri:, ip_address:)
    @uri = uri
    @ip_address = ip_address
  end
end
