class CreatePigeonMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :pigeon_messages do |t|
      t.text :information
      t.references :pigeon, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
