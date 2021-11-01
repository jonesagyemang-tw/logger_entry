# frozen_string_literal: true

RSpec.describe 'parser' do
  it 'returns ordered list of webpages with most views' do
    expected_result = <<~OUTPUT
      /home 4 visits
      /about/2 2 visits
      /help_page/1 1 visits
    OUTPUT

    expect do
      system('./lib/parser.rb sample.log')
    end.to output(Regexp.new(expected_result, Regexp::MULTILINE)).to_stdout_from_any_process
  end

  # list of webpages with most unique page views also ordered
  it 'returns ordered list of most unique page views' do
    expected_result = <<~OUTPUT
      /home 3 unique visits
      /about/2 2 unique visits
      /help_page/1 1 unique visits
    OUTPUT

    expect do
      system('./lib/parser.rb sample.log')
    end.to output(Regexp.new(expected_result, Regexp::MULTILINE)).to_stdout_from_any_process
  end
end
