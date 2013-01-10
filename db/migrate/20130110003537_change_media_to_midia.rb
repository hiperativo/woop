class ChangeMediaToMidia < ActiveRecord::Migration
  def up
  	rename_table :media, :midia
  end

  def down
  end
end
