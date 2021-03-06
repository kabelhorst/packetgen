require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
  add_filter "/vendor/"
end

RSpec.configure do |c|
  if c.filter[:sudo]
    SimpleCov.command_name 'rspec:sudo'
  else
    SimpleCov.command_name 'rspec'
  end
end

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'packetgen'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |c|
  c.include CaptureHelper
  c.include BindingHelper
  c.include EspHelper
  c.include LabelHelper
end
