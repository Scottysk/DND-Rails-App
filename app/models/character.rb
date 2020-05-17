class Character < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :users, through: :comments


	#has_many :favorite_characters
	#has_many :favorited_by, through: :favorite_charac, source: :user

	validates :name, :gender, :race, :profession, presence: true
	validates :name, length: {minimum: 2}
end
