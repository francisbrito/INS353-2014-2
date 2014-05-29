["order", "product"].each do |f|
	require File.join(File.dirname(__FILE__), '..', "lib/#{f}.rb")
end

require 'yaml'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter = :documentation
end