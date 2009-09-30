require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('magento-api', '0.1.0') do |p|
  p.description              = "Rubygem for connecting to a Magento store via the Magento Core API"
  p.url                      = ""
  p.author                   = "Tim Matheson"
  p.email                    = "me@timmatheson.com"
  p.ignore_pattern           = ["tmp/*","script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
