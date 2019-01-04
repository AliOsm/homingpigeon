class CreateSharedPigeons < ActiveRecord::Migration[5.2]
  def change
    create_table :shared_pigeons do |t|
      t.references :pigeon, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :access, default: 0

      t.timestamps
    end
  end
end
