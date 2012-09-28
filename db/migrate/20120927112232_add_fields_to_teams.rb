class AddFieldsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :url, :string
    add_column :teams, :division, :string
  end
end
