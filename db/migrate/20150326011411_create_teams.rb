class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :gamesPlayed
      t.integer :wins
      t.integer :losses
      t.integer :otLosses
      t.integer :points
      t.boolean :nhlTeam

      t.timestamps null: false
    end
  end
end
