
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'spec_helper'
require 'webmock/rspec'
require 'rspec/rails'
require 'capybara/rails'

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
  # config.filter_sensitive_data('<SOME_PLACEHOLDER>') { 'sensitive data' }
  config.configure_rspec_metadata!
end

def stub_json(verb:, url:, filename:, code: 200)
  json_response = File.open("./fixtures/#{filename}")
  stub_request(verb, url).to_return(status: code, body: json_response)
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.use_active_record = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
