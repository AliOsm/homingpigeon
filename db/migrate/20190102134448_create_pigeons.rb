class CreatePigeons < ActiveRecord::Migration[5.2]
  def change
    create_table :pigeons do |t|
      t.string :name
      t.text :description
      t.string :token
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
