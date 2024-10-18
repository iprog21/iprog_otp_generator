# frozen_string_literal: true
require 'rails/generators'

module IprogOtpGenerator
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('..', __FILE__) # Make sure this points to your templates folder

      argument :model_name, type: :string, default: "User", banner: "MODEL"

      desc "Creates a migration to add OTP fields to the specified model's table"

      def copy_migration
        # Define table name based on the model name
        table_name = model_name.tableize
      
        # Generate the migration file name
        timestamp = Time.now.utc.strftime("%Y%m%d%H%M%S")
        migration_filename = "db/migrate/#{timestamp}_add_otp_fields_to_#{table_name}.rb"
      
        # Define the content of the migration file as a string
        migration_content = <<-RUBY
            class AddOtpFieldsTo#{table_name.camelize} < ActiveRecord::Migration#{migration_version}
              def change
                add_column :#{table_name}, :otp_code, :string
                add_column :#{table_name}, :otp_code_expires_at, :datetime
                add_column :#{table_name}, :otp_code_resend_interval, :integer, default: 60
                add_column :#{table_name}, :otp_code_confirmed, :boolean, default: false
              end
            end
         RUBY
      
        # Create the migration file manually
        create_file migration_filename, migration_content
      end
      

      # This method is required by Rails generators to create a unique timestamp for migration files
      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          Time.now.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
      end

      private

      def migration_version
        if Rails::VERSION::MAJOR >= 5
          "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
      end
    end
  end
end
