class Book < ActiveRecord::Base
	attr_accessible :title, :author, :description, :cover
 #attr_protected para guardar los atributos que no quiero q se modifiquen

	validates_presence_of :title, :author
	validates_uniqueness_of :title

	has_many :reviews
	has_and_belongs_to_many :readers, :class_name => "User"
	has.attached.file :cover
end
