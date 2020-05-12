require 'rubygems'
require 'base64'
require 'json'
require_relative 'os'
require_relative 'requirements'
require_relative 'capybara'
require_relative 'lib/team'
require_relative 'helper/adapters_helper.rb'
require_relative 'helper/features_helper.rb'
# require_relative 'helper/features_helper.rb'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

STDOUT.sync = true
