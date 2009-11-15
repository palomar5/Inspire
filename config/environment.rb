RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'formtastic', :source => 'http://gemcutter.org/'
  config.gem 'formtastic', :source => 'http://gemcutter.org/'
  config.gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => 'http://gems.github.com'
  config.gem 'cucumber', :lib => false, :version => '>= 0.2.3'
  config.gem 'rspec-rails', :lib => 'spec/rails'
  config.gem 'rspec', :lib => 'spec'
  config.gem 'haml-edge', :lib => 'haml'
  config.gem 'typus', :source => 'http://gemcutter.org'
  config.i18n.default_locale = :de
end

Haml::Template.options[:format] = :html5
Haml::Template.options[:attr_wrapper] = '"'

# FIX: Typus doesn’t work with HAML unless you add this:
module ActionView::Helpers::FormHelper
  BLOCK_CALLED_FROM_ERB = 'defined? __in_erb_template'
  def block_called_from_erb?(block)
    block && eval(BLOCK_CALLED_FROM_ERB, block)
  end
end