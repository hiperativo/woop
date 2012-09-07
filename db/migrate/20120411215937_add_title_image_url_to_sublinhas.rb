class AddTitleImageUrlToSublinhas < ActiveRecord::Migration
  def self.up
    add_column :sublinhas, :title_image_url, :string
  end

  def self.down
    remove_column :sublinhas, :title_image_url
  end
end
