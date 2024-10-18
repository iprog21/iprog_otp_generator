# frozen_string_literal: true

require "active_record"
require_relative "iprog_otp_generator/version"
require_relative "iprog_otp_generator/otp_code"

if defined?(Rails)
 require_relative "generators/install_generator"
end

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
