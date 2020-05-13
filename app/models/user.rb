class User < ApplicationRecord
	has_secure_password

	has_many :characters
	validates :username, presence: true
	validates :username, uniqueness: true

	def self.create_by_google_omniauth(auth)
		self.find_or_create_by(username: auth[:info][:email]) do |u|
			u.password = SecureRandom.hex
		end
	end




end
