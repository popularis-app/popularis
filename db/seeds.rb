# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://juliet-tech.github.io/popularis-api/sentences/index.json'
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

