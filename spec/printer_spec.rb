# frozen_string_literal: true

require_relative '../lib/printer'

RSpec.describe Printer do
  describe 'print pages views' do
    context 'general' do
      it 'prints page view info' do
        printer = Printer.new(results: { 'home': [1, 2] })

        expect do
          printer.print_page_views
        end.to output(/home 2 visits/).to_stdout_from_any_process
      end
    end

    context 'unique views' do
      subject(:printer) do
        Printer.new(results: { 'sitemap': [logentry1, logentry2, logentry3] })
      end

      let(:logentry1) { double(ip_address: '212.134.2.1') }
      let(:logentry2) { double(ip_address: '212.134.2.1') }
      let(:logentry3) { double(ip_address: '212.134.2.3') }

      it 'prints unique page view info' do
        expect do
          printer.print_unique_page_views
        end.to output(/sitemap 1 unique visits/).to_stdout_from_any_process
      end

      it 'does not print non-unique page views' do
        expect do
          printer.print_unique_page_views
        end.not_to output(/sitemap 2 unique visits/).to_stdout_from_any_process
      end
    end
  end
end
