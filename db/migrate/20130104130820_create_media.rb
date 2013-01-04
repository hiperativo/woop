class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.string :type
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
