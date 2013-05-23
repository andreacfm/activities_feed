require "rails/generators/base"

module ActivitiesFeed
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.dirname(__FILE__) + "/../../templates"

    def copy_migrations
      stamp = proc {|time| time.utc.strftime("%Y%m%d%H%M%S")}
      copy_file "activities.rb", "db/migrate/#{stamp[Time.now]}_create_activities.rb"
    end
  end
end
