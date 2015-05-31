$:.unshift File.expand_path(".", __FILE__)

# This is RackUP file is used for standalone development only. 

require 'bundler'
Bundler.require

require '../lib/plugin'

run PacketsAtRest::ParPluginFacter::Plugin
