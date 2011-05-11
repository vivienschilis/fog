require 'rubygems'
require 'benchmark'
gem 'activesupport', '2.3.10'
require 'activesupport'

require File.join(File.dirname(__FILE__), '..', 'lib', 'fog')

data = File.open(File.expand_path('~/.fog')).read
@config = YAML.load(data)[:default]

TIMES = 1000

def init_object
  
   Fog::Storage.new(:provider => 'AWS',
    :aws_access_key_id => @config[:aws_access_key_id],
    :aws_secret_access_key => @config[:aws_secret_access_key]
  )

end

Benchmark.bmbm(25) do |bench|
  bench.report('Fog::Storage.new') do
    TIMES.times do |x|
      init_object
    end
  end
end