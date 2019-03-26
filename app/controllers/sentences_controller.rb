class SentencesController < ApplicationController
  def index
  	# @sentences = Sentence.all
  	# raise
    @query = params[:query]
  	if params[:query].present?
  		sql_query = " \
  		sentences.name @@ :query \
      OR sentences.category @@ :query \
      OR sentences.institution @@ :query \
      OR sentences.entry_point @@ :query \
      OR bodies.content @@ :query \
      OR bodies.category @@ :query
  		"
      # movies.title ILIKE :query \
      #       OR movies.syllabus ILIKE :query \
      #       OR directors.first_name ILIKE :query \
      #       OR directors.last_name ILIKE :query \
  		# @sentences = Sentence.where(sql_query, query: "%#{params[:query]}%")
      # @sentences = @sentences.uniq
      # @sentences.each do |sentence|
      #   if sentence.uniq(@sentences)
      # end
  		@sentences = Sentence.joins(:bodies).where(sql_query, query: "%#{params[:query]}%")
  		# raise
  	else
  		@sentences = Sentence.all
  	end
  end

  def show
  end
end
