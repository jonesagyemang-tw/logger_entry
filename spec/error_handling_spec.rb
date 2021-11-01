# frozen_string_literal: true

require_relative '../lib/errors/missing_logfile_error'

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

  context 'log file does not exist' do
    it 'should raise an exception' do
      expect do
        system('./lib/parser.rb nonexistent.log')
      end.to output(/Log file not found/).to_stderr_from_any_process
    end
  end

  context 'log file exists' do
    it 'should not raise an exception' do
      expect do
        system('./lib/parser.rb sample.log')
      end.not_to output(/Log file not found/).to_stderr_from_any_process
    end
  end
end
