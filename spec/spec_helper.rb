begin
  require 'simplecov'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter
  ]

  SimpleCov.start do
    add_filter '/spec/'
  end
rescue LoadError
  # Skip loading
end

require 'rubygems'

RSpec.configure do |config|
  config.color = true
  config.formatter = 'documentation'
  config.order = 'random'
  config.expect_with(:rspec) do |c|
    c.syntax = %i[should expect]
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = %i[should expect]
  end
end
