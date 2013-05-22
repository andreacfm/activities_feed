class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer   :owner_id, :null => false
      t.string    :owner_type, :name, :null => false
      t.string    :name, :null => false
      t.timestamps
    end

    add_index :activities, :owner_type
    add_index :activities, :owner_id
  end

  def self.down
    drop_table :activities
  end
end
