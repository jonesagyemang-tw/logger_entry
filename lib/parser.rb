# frozen_string_literal: true

# Parses a given server log file
class Parser
  attr_accessor :unprocessable_entity_count, :processed_entries, :results
  attr_reader :file

  def initialize(file:)
    @processed_entries = []
    @unprocessable_entity_count = 0
    @results = {}
    @file = file
  end

  def parse
    File.foreach(file) do |entry|
      uri, ip_address = entry.split ' '
      log_entry = LogEntry.new(uri: uri, ip_address: ip_address)
      if log_entry.valid?
        processed_entries << log_entry
      else
        self.unprocessable_entity_count += 1
      end
    end
  end

  def run
    parse
    process_valid_entries
    print_page_views
    print_unique_page_views
  end

  private

  def process_valid_entries
    self.results = processed_entries.group_by(&:uri)
                                    .sort_by { |_, value| value.count }
                                    .reverse
                                    .to_h
  end

  def print_page_views
    results.each do |key, value|
      puts "#{key} #{value.count} visits"
    end
  end

  def print_unique_page_views
    results.each do |key, value|
      puts "#{key} #{value.uniq(&:ip_address).count} unique visits"
    end
  end
end
