# frozen_string_literal: true

RSpec.describe 'parser' do
  subject(:system_run) { system('./lib/parser.rb sample.log') }

  it 'returns ordered list of webpages with most views' do
    expected_result = <<~OUTPUT
      /home 4 visits
      /about/2 2 visits
      /help_page/1 1 visits
    OUTPUT

    expectation = Regexp.new(expected_result, Regexp::MULTILINE)

    expect { system_run }.to output(expectation).to_stdout_from_any_process
  end

  it 'returns ordered list of most unique page views' do
    expected_result = <<~OUTPUT
      /home 3 unique visits
      /about/2 2 unique visits
      /help_page/1 1 unique visits
    OUTPUT

    expectation = Regexp.new(expected_result, Regexp::MULTILINE)

    expect { system_run }.to output(expectation).to_stdout_from_any_process
  end
end
