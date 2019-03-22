class SentencesController < ApplicationController
  def index
  	@sentences = Sentence.all
  end

  def show
  end
end
