require 'digest/sha1'
class User < ActiveRecord::Base

	before_save :encrypt

	attr_accessor :nombre, :email, :password, :password_confirmation

	#Nombre y Email unicos?
	validates :nombre, :email, :uniqueness => true

	#Tamaño
	validates :nombre, :length => {:in=>2..20}
	validates :email, length: { maximum: 500 }

	#Formatos
	validates :email, 
	:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

	#Validar terms and services

	

	#Validar pass
	  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create

#Encriptar pass

	def encrypt
		self.password = Digest::SHA1.hexdigest(self.password)
	end


end
