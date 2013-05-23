module ActivitiesFeed
  class Railtie < Rails::Railtie
    generators do
      require "activities_feed/generator"
    end
  end
end
