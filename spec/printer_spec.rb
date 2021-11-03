# frozen_string_literal: true

require_relative '../lib/printer'

RSpec.describe Printer do
  describe 'print page views' do
    context 'general' do
      it 'prints page view info' do
        printer = Printer.new(page_views: { 'molineux': [1, 2] })

        expect do
          printer.print_page_views
        end.to output(/molineux 2 visits/).to_stdout_from_any_process
      end
    end
  end
end

RSpec.describe Printer do
  context 'unique views' do
    subject(:printer) do
      Printer.new(
        page_views: {
          'molineux': [logentry1, logentry2, logentry3],
          'stamford_bridge': [logentry1, logentry2]
        }
      )
    end

    let(:logentry1) { double(ip_address: '212.134.2.1') }
    let(:logentry2) { double(ip_address: '212.134.2.1') }
    let(:logentry3) { double(ip_address: '212.134.2.3') }

    it 'prints unique page view info' do
      expect do
        printer.print_unique_page_views
      end.to output(/molineux 1 unique visits/).to_stdout_from_any_process
    end

    it 'does not print non-unique page views' do
      expect do
        printer.print_unique_page_views
      end.not_to output(/stamford_bridge 0 unique visits/).to_stdout_from_any_process
    end
  end
end
