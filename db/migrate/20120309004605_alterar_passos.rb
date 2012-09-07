class AlterarPassos < ActiveRecord::Migration
	def self.up
		change_table :passos do |t|
			t.remove :produto_id
			t.remove :passos
			t.string :name
			t.string :descricao
			t.string :indicacao
		end
	end

	def self.down
	end
end
