class RenameLinhaIdToSublinhaId < ActiveRecord::Migration
  def self.up
  	rename_column :produtos, :linha_id, :sublinha_id
  end

  def self.down
  end
end