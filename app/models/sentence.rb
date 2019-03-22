class Sentence < ApplicationRecord
	has_many :bodies
	has_many :feedbacks
	has_many :responsibles
end
