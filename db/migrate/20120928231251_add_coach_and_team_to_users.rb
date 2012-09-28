class AddCoachAndTeamToUsers < ActiveRecord::Migration
  def change
    add_column :users, :coach, :boolean, default: false
    add_column :users, :team, :string
  end
end
