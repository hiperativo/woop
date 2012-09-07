class AddImageUrlToProdutos < ActiveRecord::Migration
  def self.up
    add_column :produtos, :image_url, :string
  end

  def self.down
    remove_column :produtos, :image_url
  end
end
