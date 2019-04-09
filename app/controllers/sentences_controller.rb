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

      # Try putting % % around :query -> https://sqlbolt.com/lesson/select_queries_with_constraints_pt_2
  		@sql_results = Sentence.joins(:bodies).where(sql_query, query: "%#{params[:query]}%")
      @query_qty = @sql_results.each_with_object(Hash.new(0)) { |sentence, counts| counts[sentence] += 1 }
      @sorted_sentences = @query_qty.sort_by { |sentence, qty| qty }.reverse
      @sentences = @sorted_sentences.map { |e| e[0] }
  	else
  		@sentences = Sentence.all
  	end
  end

  def show
    @sentence = Sentence.find(params[:id])
    @bodies = @sentence.bodies.sort_by{ |body| body.number }
  end
end
