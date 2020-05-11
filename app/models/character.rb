class Character < ApplicationRecord
	belongs_to :user

	validates :name, :gender, :race, :profession, presence: true
	validates :name, length: {minimum: 2}
end
