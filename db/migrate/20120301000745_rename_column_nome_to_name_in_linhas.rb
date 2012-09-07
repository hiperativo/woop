class RenameColumnNomeToNameInLinhas < ActiveRecord::Migration
  def self.up
  	rename_column :linhas, :nome, :name
  end

  def self.down
  	rename_column :linhas, :name, :nome
  end
end
