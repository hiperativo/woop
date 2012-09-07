class AddRoleToContatos < ActiveRecord::Migration
  def self.up
    add_column :contatos, :role, :string
  end

  def self.down
    remove_column :contatos, :role
  end
end
