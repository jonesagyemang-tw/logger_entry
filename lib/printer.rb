# frozen_string_literal: true

require 'pry'

# Prints results from parsed server logs
class Printer
  attr_reader :results

  def initialize(results:)
    @results = results || {}
  end

  def print_page_views
    results.each do |uri, log_entry|
      puts "#{uri} #{log_entry.count} visits"
    end
  end

  def print_unique_page_views
    results.each do |uri, log_entry|
      unique_occurrences = log_entry.map(&:ip_address)
                                    .tally
                                    .select { |_, occurrences| occurrences == 1 }
      puts "#{uri} #{unique_occurrences.count} unique visits"
    end
  end
end
