module ActivitiesFeed
  module Feedable

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods

      def feedable args={}

        has_many :activities, as: :feedable

        define_method :feeder_options do
          args
        end

        define_method :create_activity do |activity|
          namespace = feeder_options.fetch(:namespace, nil)
          name = namespace ? "#{namespace}.#{activity}" : activity
          self.activities.create name: name
        end

        define_method :feed do |args={}|
          order = args.fetch(:order, 'created_at DESC')
          self.activities.order(order)
        end

      end

    end

  end
end

ActiveRecord::Base.send :include, ActivitiesFeed::Feedable
