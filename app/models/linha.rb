class Linha < ActiveRecord::Base
	has_many :sublinhas
	has_many :produtos, :through => :sublinhas

	attr_accessible :name, :ordem
end
