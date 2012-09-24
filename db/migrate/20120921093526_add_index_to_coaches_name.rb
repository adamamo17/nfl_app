class AddIndexToCoachesName < ActiveRecord::Migration
  def change
    add_index :coaches, :name, unique: true
  end
end
