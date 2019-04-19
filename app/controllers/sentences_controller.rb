require 'open-uri'

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
    @query = params[:query]
    @feedback = Feedback.new(query: @query)
  end

  def updating_db
    url = 'https://raw.githubusercontent.com/juliet-tech/popularis-api/master/sentences/index.json'
    serialized_sentences = open(url).read
    sentences = JSON.parse(serialized_sentences)
    sentences = sentences["Sentencias"]

    p 'Destroying everything......'
    Part.destroy_all
    Notified.destroy_all
    Responsible.destroy_all
    Body.destroy_all
    Feedback.destroy_all
    Sentence.destroy_all

    sentences.each do |sentence|
      p 'Creating sentence....'
      s = Sentence.create!(name: sentence["Nombre"], entry_point: sentence["Entrada"], category: sentence["Tipo"], date: sentence["Fecha"], institution: sentence["Institucion"])


      p 'Creating body.....'
      sentence["Cuerpo"].each do |cuerpo|
        Body.create!(category: cuerpo["Tipo"], content: cuerpo["Contenido"], number: cuerpo["Numero"], sentence: s)
      end

      p 'Creating notifieds......'
      sentence["Notificados"].each do |notificado|
        Notified.create!(title: notificado["Titulo"], name: notificado["Nombre"], number: notificado["Numero"], sentence: s)
      end

      p 'Creating responsibles.........'
        Responsible.create!(name: sentence["Responsable"]['Nombre'], category: sentence["Responsable"]['Tipo'], sentence: s)

      p 'Creating parts.........'
      sentence["Partes"].each do |parte|
        Part.create!(relevance: parte["Relevancia"], name: parte["Nombre"], title: parte["Titulo"], category: parte["Tipo"], national_id: parte["Cedula"], domicile: parte["Domicilio"], sentence: s)
      end
    end

    redirect_to sentences_path
  end
end
