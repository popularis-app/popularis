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
  		@sentences = Sentence.joins(:bodies).where(sql_query, query: "%#{params[:query]}%")
      # Antes de solo display las .uniq -> orderlas en orden dependiendo de la que mas salga repetida.... weighted display on index
  		@sentences = @sentences.uniq
      # raise
  	else
  		@sentences = Sentence.all
  	end
  end

  def show
    @sentence = Sentence.find(params[:id])
  end
end
