module CustomStreams
  module Streamer

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods

      def streamer args={}

        define_method :streamer_options do
          args
        end

        define_method :create_activity do |activity|
          namespace = streamer_options.fetch(:namespace, nil)
          p namespace
          name = namespace ? "#{namespace}.#{activity}" : activity
          p name
          Activity.create owner_id: self.id, owner_type: self.class.to_s, name: name
        end

        define_method :stream do |args={}|
          order = args.fetch(:order, 'created_at DESC')
          Activity.where(owner_id: self.id).order(order)
        end

      end

    end

  end
end

ActiveRecord::Base.send :include, CustomStreams::Streamer
