class CreateStages < ActiveRecord::Migration[5.1]
  def change
    create_table :stages do |t|
      t.string :name, null: false
      t.string :image_url

      t.timestamps
    end
  end
end
