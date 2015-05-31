$:.unshift File.expand_path(".", __FILE__)

require 'bundler'
Bundler.require

require './lib/plugin'

run PacketsAtRest::ParPluginFacter::Plugin
