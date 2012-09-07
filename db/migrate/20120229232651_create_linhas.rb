class CreateLinhas < ActiveRecord::Migration
  def self.up
    create_table :linhas do |t|
      t.string :nome
      t.integer :ordem

      t.timestamps
    end
  end

  def self.down
    drop_table :linhas
  end
end
