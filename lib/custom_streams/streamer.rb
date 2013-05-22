module CustomStreams
  module Streamer

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods

      def streamer args={}

        has_many :activities, as: :streamable

        define_method :streamer_options do
          args
        end

        define_method :create_activity do |activity|
          namespace = streamer_options.fetch(:namespace, nil)
          name = namespace ? "#{namespace}.#{activity}" : activity
          self.activities.create name: name
        end

        define_method :stream do |args={}|
          order = args.fetch(:order, 'created_at DESC')
          self.activities.order(order)
        end

      end

    end

  end
end

ActiveRecord::Base.send :include, CustomStreams::Streamer
