# frozen_string_literal: true

# Prints page views from parsed server logs
class Printer
  attr_reader :page_views

  def initialize(page_views:)
    @page_views = page_views || {}
  end

  def print_page_views
    page_views.each do |uri, log_entry|
      puts "#{uri} #{log_entry.count} visits"
    end
  end

  def print_unique_page_views
    page_views.each do |uri, log_entry|
      unique_occurrences = log_entry.map(&:ip_address)
                                    .tally
                                    .select { |_, occurrences| occurrences == 1 }
                                    .count
      puts "#{uri} #{unique_occurrences} unique visits" if unique_occurrences.positive?
    end
  end
end
