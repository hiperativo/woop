class AddTelefoneToContatos < ActiveRecord::Migration
  def self.up
    add_column :contatos, :telefone, :string
  end

  def self.down
    remove_column :contatos, :telefone
  end
end
