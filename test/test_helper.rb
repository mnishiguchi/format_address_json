require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "mocha/mini_test"

# Minitest-reporters is a progress-bar-style reporter by default
# but we can alternatively use a document-style reporter.
# https://github.com/kern/minitest-reporters#caveats
require "minitest/reporters"
Minitest::Reporters.use!(
  # (Minitest::Reporters::SpecReporter.new) # Enable document-style reporter.
)

# Shoulda-matchers
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Make FactoryGirl code concise.
  include FactoryGirl::Syntax::Methods
end
