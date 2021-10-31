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
end
