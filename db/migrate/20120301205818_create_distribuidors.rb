class CreateDistribuidors < ActiveRecord::Migration
  def self.up
    create_table :distribuidors do |t|
      t.string :name
      t.integer :estado_id
      t.string :telefone
      t.text :endereco

      t.timestamps
    end
  end

  def self.down
    drop_table :distribuidors
  end
end
