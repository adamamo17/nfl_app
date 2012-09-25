class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team
      t.string :abbrev

      t.timestamps
    end
  end
end
