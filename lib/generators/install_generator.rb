# frozen_string_literal: true

module IprogOtpGenerator
 module Generators
  class InstallGenerator < Rails::Generators::Base
   source_root File.expand_path('..', __FILE__)

   argument :model_name, type: :string, default: "User", banner: "MODEL"

   desc "Creates a migration to add OTP fields to the specified model's table"

   def copy_migration
    model      = model_name.constantize
    table_name = model.table_name
    timestamp  = Time.now.utc.strftime("%Y%m%d%H%M%S")

    migration_template "migration.rb.tt", "db/migrate/add_otp_fields_to#{table_name}.rb", migration_version: migration_version, table_name: table_name 
   end

   private
   def migration_version
    if Rails.version.start_with?("5") || Rails.version.start_with("6")
     "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
    end
   end
  end
 end
end
