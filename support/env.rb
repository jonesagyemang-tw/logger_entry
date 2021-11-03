# frozen_string_literal: true

require 'pry'

Dir['./lib/**/*.rb'].each { |file| require file unless /main/.match? file }
