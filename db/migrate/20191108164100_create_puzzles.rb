class CreatePuzzles < ActiveRecord::Migration[6.0]
  def change
    create_table :puzzles do |t|
      t.string :grid, array: true, default: []
      t.integer :gridnums, array: true, default: []
      t.string :cluesAcross, array: true, default: []
      t.string :cluesDown, array: true, default: []
      t.string :answersAcross, array: true, default: []
      t.string :answersDown, array: true, default: []

      t.timestamps
    end
  end
end
