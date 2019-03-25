class Body < ApplicationRecord
	belongs_to :sentence


	  include PgSearch
	  pg_search_scope :global_search,
	    against: [ :content ],
	    associated_against: {
	      sentence: [ :name, :category, :institution ]
	    },
	    using: {
	      tsearch: { prefix: true }
	    }
end
