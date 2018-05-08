class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.integer :stage_id, null: false

      t.timestamps
    end
  end
end
