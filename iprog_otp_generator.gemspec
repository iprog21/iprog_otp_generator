# frozen_string_literal: true

require_relative "lib/iprog_otp_generator/version"

Gem::Specification.new do |spec|
 spec.name                            = "iprog_otp_generator"
 spec.version                         = IprogOtpGenerator::VERSION
 spec.authors                         = ["Jayson Presto"]
 spec.email                           = ["jaysonpresto.iprog21@gmail.com"]

 spec.summary                         = "A simple OTP generator for ActiveRecord models"
 spec.description                     = "This gem allows ActiveRecord models to generate, validate, and clear OTP codes with an expiration time."
 spec.homepage                        = "https://github.com/iprog21/iprog_otp_generator.git"
 spec.license                         = "MIT"
 spec.required_ruby_version           = ">= 3.0.0"

 spec.files                           = Dir["lib/**/*.rb"]
 spec.require_paths                   = ["lib"]

 spec.metadata["homepage_uri"]        = spec.homepage
 spec.metadata["source_code_uri"]     = "https://github.com/iprog21/iprog_otp_generator.git"
 spec.metadata["changelog_uri"]       = "https://github.com/iprog21/iprog_otp_generator/blob/master/CHANGELOG.md"
 spec.metadata["code_of_conduct_uri"] = "https://github.com/iprog21/iprog_otp_generator/blob/main/CODE_OF_CONDUCT.md"


 spec.add_dependency "activerecord"
 spec.add_development_dependency "rspec"
 spec.add_runtime_dependency "rails", ">= 5.0"
end
