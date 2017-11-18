class AddPlayerTable < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :value
      t.string :name
      
      t.timestamps
    end
  end
end
