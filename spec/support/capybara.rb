require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'
# require 'capybara/session'
# require 'phantomjs/poltergeist'

Capybara.register_driver :poltergeist do |app|
  options = { phantomjs_options: %w[--load-images=no --ignore-ssl-errors=yes] }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.default_selector  = :css
# Capybara.default_driver    = :poltergeist
Capybara.javascript_driver = :poltergeist
