class AlterarPassosDescricaoToText < ActiveRecord::Migration
  def self.up
  	change_table :passos do |t|
  		t.remove :descricao
  		t.text :descricao
  	end
  end

  def self.down
  end
end