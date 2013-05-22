module CustomStreams
  class Railtie < Rails::Railtie
    generators do
      require "custom_streams/generator"
    end
  end
end
