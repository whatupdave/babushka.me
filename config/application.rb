require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module BabushkaMe
  class Application < Rails::Application
    config.autoload_paths += %W[#{config.root}/lib]
    config.filter_parameters += [:password]
  end
end
