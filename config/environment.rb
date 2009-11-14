RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => 'http://gems.github.com'
  config.gem 'cucumber', :lib => false, :version => '>= 0.2.3'
  config.gem 'rspec-rails', :lib => 'spec/rails'
  config.gem 'rspec', :lib => 'spec'
  config.gem 'haml-edge', :lib => 'haml'
  config.i18n.default_locale = :de
end

Haml::Template.options[:format] = :html5
Haml::Template.options[:attr_wrapper] = '"'
