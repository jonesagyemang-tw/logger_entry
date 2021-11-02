# frozen_string_literal: true

require_relative '../lib/parser'

RSpec.describe Parser do
  describe 'parsing' do
    context 'valid entries' do
      it 'processes valid entries only' do
        parser = Parser.new(file: 'sample.log')
        parser.parse

        expect(parser.processed_entries.count).to eq(7)
      end

      it 'ignores invalid entries' do
        parser = Parser.new(file: 'sample.log')
        parser.parse

        expect(parser.unprocessable_entity_count).to eq(3)
      end
    end
  end
end
