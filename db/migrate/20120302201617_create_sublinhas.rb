class CreateSublinhas < ActiveRecord::Migration
  def self.up
    create_table :sublinhas do |t|
      t.integer :linha_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :sublinhas
  end
end
