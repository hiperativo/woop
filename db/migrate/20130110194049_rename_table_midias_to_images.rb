class RenameTableMidiasToImages < ActiveRecord::Migration
  def up
  	rename_table :midia, :images
  end

  def down
  end
end
