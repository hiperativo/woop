class CreatePassos < ActiveRecord::Migration
  def self.up
    create_table :passos do |t|
      t.integer :produto_id
      t.text :passos

      t.timestamps
    end
  end

  def self.down
    drop_table :passos
  end
end
