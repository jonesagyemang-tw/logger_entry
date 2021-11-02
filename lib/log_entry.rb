#!/usr/bin/env ruby
# frozen_string_literal: true

# class to handle log entries from any given server log file
class LogEntry
  attr_reader :uri, :ip_address

  IP_REGEX = /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/

  def initialize(uri:, ip_address:)
    @uri = uri
    @ip_address = ip_address
  end

  def valid?
    !uri.nil? && !uri.empty? && IP_REGEX.match?(ip_address)
  end
end
