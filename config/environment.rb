RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'chriseppstein-compass', :lib => 'compass',                        :source => 'http://gems.github.com/'
  config.gem 'haml',                  :lib => 'haml',    :version => '>=2.2.0'
  config.gem 'authlogic'
  config.gem 'chriseppstein-compass', :lib => 'compass', :version => '0.8.17',  :source => 'http://gems.github.com/'
  #config.gem 'rmagick',               :lib => "RMagick", :version => '2.9.1'  
  config.gem 'rmagick',               :lib => "RMagick", :version => '1.15.17'  # heroku
  config.gem 'typus',                                                           :source => 'http://gemcutter.org'
  config.i18n.default_locale = :en
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