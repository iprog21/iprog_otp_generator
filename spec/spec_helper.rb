# frozen_string_literal: true

require "bundler/setup"
require "active_record"
require "sqlite3"
require_relative "../lib/iprog_otp_generator"

ActiveRecord::Base.establish_connection(
 adapter: "sqlite3",
 database: ":memory:"
)

ActiveRecord::Schema.define do
 create_table :users, force: true do |t|
  t.string :otp_code
  t.datetime :otp_code_expires_at

  t.timestamps
 end
end

RSpec.configure do |config|
 config.expect_with :rspec do |expectations|
  expectations.syntax = :expect
 end

 config.mock_with :rspec do |mocks|
  mocks.syntax = :expect
 end
end
