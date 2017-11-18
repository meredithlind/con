class AddGameBoardTable < ActiveRecord::Migration[5.1]
  def change
    create_table :game_boards do |t|
      t.integer :board, array: true
      t.timestamps
    end
  end
end
