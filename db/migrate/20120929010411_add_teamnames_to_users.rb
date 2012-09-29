class AddTeamnamesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :teamname, :string
    remove_column :users, :team, :string
  end
end
