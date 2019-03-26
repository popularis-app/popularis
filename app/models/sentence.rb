class Sentence < ApplicationRecord
	has_many :bodies
	has_many :feedbacks
	has_many :responsibles
	has_many :parts

	# include PgSearch
	#   pg_search_scope :global_search,
	#     against: [ :name, :category, :institution ],
	#     associated_against: {
	#       body: [ :content ]
	#     },
	#     using: {
	#       tsearch: { prefix: true }
	#     }
end
