# frozen_string_literal: true

require_relative '../lib/log_entry'

RSpec.describe LogEntry do
  describe '#validation' do
    context 'invalid IP Address' do
      it 'should be invalid' do
        log_entry = LogEntry.new(uri: '/home', ip_address: 'foo')

        expect(log_entry.valid?).to be_falsey
      end
    end
  end
end
