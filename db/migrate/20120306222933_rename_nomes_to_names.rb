class RenameNomesToNames < ActiveRecord::Migration
  def self.up
  	rename_column :estados 		, :nome, :name
  	rename_column :produtos 	, :nome, :name
  end

  def self.down
  end
end
