# frozen_string_literal: true

require "spec_helper"
require "active_record"
require_relative "../lib/iprog_otp_generator"

class User < ActiveRecord::Base
 enable_otp
end

RSpec.describe IprogOtpGenerator do
 let(:user) { User.new }

 it "generates a vaild OTP Code" do
  user.generate_otp_code
 
  expect(user.otp_code).not_to be_nil
  expect(user.otp_code_expires_at).to be > Time.now
 end

 it "validates a correct OTP Code" do
  user.generate_otp_code
  user.otp_code_expires_at = Time.now - 1.minute

  expect(user.valid_otp_code?(user.otp_code)).to be_falsy
 end

 it "regenerates OTP Code until it is unique" do
  allow(User).to receive(:exists?).and_return(true, true, false)
  expect(user).to receive(:save!).once
  user.generate_otp_code
 end
 
 it "validates clear_otp_code method" do
  user.generate_otp_code
  user.clear_otp_code

  expect(user.valid_otp_code?).to be_falsy
 end
end
