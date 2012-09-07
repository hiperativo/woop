class CreateClippings < ActiveRecord::Migration
  def self.up
    create_table :clippings do |t|
      t.date :lancamento
      t.string :name
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :clippings
  end
end
