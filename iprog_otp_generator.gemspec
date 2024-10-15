# frozen_string_literal: true

require_relative "lib/iprog_otp_generator/version"

Gem::Specification.new do |spec|
 spec.name          = "iprog_otp_generator"
 spec.version       = IprogOtpGenerator::VERSION
 spec.authors       = ["Jayson Presto"]
 spec.email         = ["jaysonpresto.iprog21@gmail.com"]

 spec.summary       = "A simple OTP generator for ActiveRecord models"
 spec.description   = "This gem allows ActiveRecord models to generate, validate, and clear OTP codes with an expiration time."
 spec.homepage      = "https://github.com/iprog21/iprog_otp_generator"
 spec.license       = "MIT"

 spec.files         = Dir["lib/**/*.rb"]
 spec.require_paths = ["lib"]

 spec.add_dependency "activerecord"
 spec.add_development_dependency "rspec"
end
