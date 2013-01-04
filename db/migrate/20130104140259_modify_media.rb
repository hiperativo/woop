class ModifyMedia < ActiveRecord::Migration
  def self.up
    remove_column :media, :type
    add_column :media, :category, :string
  end
end
