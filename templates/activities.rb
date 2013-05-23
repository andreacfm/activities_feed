class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer   :feedable_id, :null => false
      t.string    :feedable_type, :name, :null => false
      t.string    :name, :null => false
      t.timestamps
    end

    add_index :activities, :feedable_type
    add_index :activities, :feedable_id
  end

  def self.down
    drop_table :activities
  end
end
