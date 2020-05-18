class Character < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :users, through: :comments


	#has_many :favorite_characters
	#has_many :favorited_by, through: :favorite_charac, source: :user

	validates :name, :gender, :race, :profession, :level, presence: true
	validates :name, length: {minimum: 2}


	scope :most_recent, -> {order(name: :asc)}
	scope :elves, -> { where(race: "Elf")}


	def self.search(search)
		if search
			character_type = Character.find_by(name: search)
				if character_type
					self.where(id: character_type)
				else
					Character.all
				end
		else
				Character.all
		end
	end


end


