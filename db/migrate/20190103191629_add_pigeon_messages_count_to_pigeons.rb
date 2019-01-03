class AddPigeonMessagesCountToPigeons < ActiveRecord::Migration[5.2]
  def change
    add_column :pigeons, :pigeon_messages_count, :integer, default: 0
  end
end
