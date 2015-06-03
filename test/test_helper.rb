# test_helper.rb
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/reporters'
require_relative 'support/awesomereporter'

require 'rack/test'

module PacketsAtRest
  ROLE = :unit_test
end

reporter_options = { color: true, slow_count: 5, slow_threshold: 3.0  }
Minitest::Reporters.use! [Minitest::Reporters::AwesomeReporter.new(reporter_options)]
