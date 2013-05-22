class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer   :streamable_id, :null => false
      t.string    :streamable_type, :name, :null => false
      t.string    :name, :null => false
      t.timestamps
    end

    add_index :activities, :streamable_type
    add_index :activities, :streamable_id
  end

  def self.down
    drop_table :activities
  end
end
