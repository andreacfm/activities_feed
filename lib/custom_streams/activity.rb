class Activity < ActiveRecord::Base
  belongs_to :streamable, :polymorphic => true
end