# frozen_string_literal: true
require 'rails/generators'
require 'rails/generators/migration'

module IprogOtpGenerator
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration  # Place it here to include migration support

      source_root File.expand_path('../', __dir__)  # Make sure this points to your templates folder

      argument :model_name, type: :string, default: "User", banner: "MODEL"

      desc "Creates a migration to add OTP fields to the specified model's table"

      def copy_migration
        model      = model_name.constantize
        table_name = model.table_name

        migration_template "migration.rb.tt", "db/migrate/add_otp_fields_to_#{table_name}.rb", table_name: table_name, migration_version: migration_version
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
