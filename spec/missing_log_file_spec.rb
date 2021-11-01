# frozen_string_literal: true

RSpec.describe 'error handling' do
  context 'missing log file' do
    it 'throws an exception' do
      expect do
        system('./lib/parser.rb')
      end.to output(/Missing log file/).to_stderr_from_any_process
    end
  end

  context 'log file is available' do
    it 'should not throw an exception' do
      expect do
        system('./lib/parser.rb anyfile.log')
      end.to_not output(/Missing log file/).to_stderr_from_any_process
    end
  end
end
