# frozen_string_literal: true

RSpec.describe 'error handling' do
  context 'log file does not exist' do
    it 'should raise an exception' do
      # FIX ME: Replace with unit tests. Failure should be triggered from calling a Parser object
      expect do
        system('./lib/main.rb nonexistent.log')
      end.to output(/Log file not found/).to_stderr_from_any_process
    end
  end

  context 'log file exists' do
    it 'should not raise an exception' do
      # FIX ME: Replace with unit tests. Failure should be triggered from calling a Parser object
      expect do
        system('./lib/main.rb sample.log')
      end.not_to output(/Log file not found/).to_stderr_from_any_process
    end
  end
end
