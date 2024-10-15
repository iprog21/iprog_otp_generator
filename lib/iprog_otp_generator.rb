# frozen_string_literal: true

require "active_record"
require_relative "iprog_otp_generator/version"
require_relative "iprog_otp_generator/otp_code"

module IprogOtpGenerator
 def self.included(base)
  base.extend(ClassMethods)
 end

 module ClassMethods
  def enable_otp
   include IprogOtpGenerator::OtpCode
  end
 end
end

ActiveRecord::Base.include IprogOtpGenerator
