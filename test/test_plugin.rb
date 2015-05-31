# test.rb
require File.expand_path '../test_helper', __FILE__
require_relative '../lib/plugin'
require 'json'

class NodeTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods
  include JSON

  def app
    PacketsAtRest::ParPluginFacter::Plugin
  end

  # /data.pcap
  def test_get_facter_output_as_json
      get '/facter'
      json = JSON.parse(last_response.body)
      assert(last_response.ok?, 'should be ok')
      assert((json.key?('rubyversion') and json['rubyversion'] == ::RUBY_VERSION), 'Something is wrong with facter')
  end

end
