require 'digest/sha1'
class User < ActiveRecord::Base

	before_save :encrypt

	attr_accessor :nombre, :email, :password, :confirm_password

	#Nombre y Email unicos?
	validates :nombre, :email, :uniqueness => true

	#Tamaño
	validates :nombre, :length => {:in=>2..20}
	validates :email, length: { maximum: 500 }
	validates :password, :length => {:in=>6..20}

	#Formatos
	validates :email, 
	:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

#Encriptar pass

	def encrypt
		self.password = Digest::SHA1.hexdigest(self.password)
	end


end
