class RemoveSublinhaFromProdutos < ActiveRecord::Migration
  def self.up
  	remove_column :produtos, :sublinha
  end

  def self.down
  end
end
