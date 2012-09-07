class AddLinhaIdToProdutos < ActiveRecord::Migration
  def self.up
    add_column :produtos, :linha_id, :integer
  end

  def self.down
    remove_column :produtos, :linha_id
  end
end
