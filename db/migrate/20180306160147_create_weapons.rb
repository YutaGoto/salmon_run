class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.string :name, null: false
      t.string :short_name

      t.timestamps
    end
  end
end
