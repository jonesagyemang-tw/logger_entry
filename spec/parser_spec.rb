# frozen_string_literal: true

RSpec.describe 'parser' do
  it 'returns ordered list of webpages with most views' do
    expected_result = '/home 3 visits /about/2 2 visits /help_page/1 1 visits '

    expect do
      system('./lib/parser.rb sample.log')
    end.to output(expected_result).to_stdout_from_any_process
  end
end
