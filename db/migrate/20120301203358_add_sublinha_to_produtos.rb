class AddSublinhaToProdutos < ActiveRecord::Migration
  def self.up
    add_column :produtos, :sublinha, :string
  end

  def self.down
    remove_column :produtos, :sublinha
  end
end
