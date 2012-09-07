class RenameImageCollumns < ActiveRecord::Migration
  def self.up
  	rename_column :produtos, :image_url, :image
  	rename_column :sublinhas, :title_image_url, :title_image
  end

  def self.down
  end
end
