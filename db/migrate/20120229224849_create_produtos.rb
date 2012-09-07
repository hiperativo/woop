class CreateProdutos < ActiveRecord::Migration
  def self.up
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.text :principios_ativos
      t.string :ph
      t.text :acao
      t.text :modo_de_usar
      t.integer :linha_id

      t.timestamps
    end
  end

  def self.down
    drop_table :produtos
  end
end
