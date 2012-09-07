class RemoveLinhaIdFromProdutos < ActiveRecord::Migration
	def self.up
		remove_column :produtos, :linha_id
	end

	def self.down
	end
end
