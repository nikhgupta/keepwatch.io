require 'simplecov'
# require 'coveralls' and Coveralls.wear_merged! if ENV['TRAVIS']

SimpleCov.start "rails" do
  add_group "Admin", "app/admin"
end
