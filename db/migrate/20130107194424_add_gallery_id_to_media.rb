class AddGalleryIdToMedia < ActiveRecord::Migration
  def change
    add_column :media, :gallery_id, :integer
  end
end
