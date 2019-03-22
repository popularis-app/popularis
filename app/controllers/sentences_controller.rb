class SentencesController < ApplicationController
  def index
  	# @sentences = Sentence.all
  	# raise
  	if params[:query].present?
  		sql_query = " \
  		sentences.name @@ :query \

  		"
  		@sentences = Sentence.where(sql_query, query: "%#{params[:query]}%")
  		# @sentences = Sentence.joins(:bodies).where(sql_query, query: "%#{params[:query]}%")
  		# raise
  	else
  		@sentences = Sentence.all
  	end
  end

  def show
  end
end
