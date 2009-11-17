class CreateTravels < ActiveRecord::Migration
  def self.up
    create_table :travels do |t|
      t.integer :user_id, :null => false
      t.string :url
      t.string :event
      t.string :location, :null => false
      t.datetime :from,   :null => false
      t.datetime :to,     :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :travels
  end
end
