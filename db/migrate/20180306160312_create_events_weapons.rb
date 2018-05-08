class CreateEventsWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :events_weapons do |t|
      t.integer :event_id
      t.integer :weapon_id

      t.timestamps
    end
  end
end
