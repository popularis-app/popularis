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
  		@sentences = Sentence.joins(:bodies).where(sql_query, query: "%#{params[:query]}%")
      @query_qty = @sentences.each_with_object(Hash.new(0)) { |sentence, counts| counts[sentence] += 1 }
      @sorted_sentences = @query_qty.sort_by { |sentence, qty| qty }.reverse
      @sentences = @sorted_sentences.map { |e| e[0] }

      # @sentences = @sentences.sort_by { |sentence| @sentences.grep(sentence).size }

      # @sentences.each do |sentence|
      #  sentence.bodies.map do |body|
      #     body.content.count(@query)
      #   end
      # end

      # Antes de solo display las .uniq -> orderlas en orden dependiendo de la que mas salga repetida.... weighted display on index
      # @sentences = @sentences.uniq
  	else
  		@sentences = Sentence.all
  	end
  end

  def show
    @sentence = Sentence.find(params[:id])
  end
end
