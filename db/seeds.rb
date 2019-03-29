# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'json'

p "Parsing JSON file"
filepath = 'sentencias.json'
serialized_sentence = File.read(filepath)
sentences = JSON.parse(serialized_sentence)
sentences = sentences["Sentencias"]

p 'Destroying everything......'
Part.destroy_all
Notified.destroy_all
Responsible.destroy_all
Body.destroy_all
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
  p sentence['Responsable']
 p sentence["Responsable"].first
    r = Responsible.create!(name: sentence["Responsable"]['Nombre'], category: sentence["Responsable"]['Tipo'], sentence: s)
    p r
  # end

	p 'Creating parts.........'
	sentence["Partes"].each do |parte|
		part = Part.create!(relevance: parte["Relevancia"], name: parte["Nombre"], title: parte["Titulo"], category: parte["Tipo"], national_id: parte["Cedula"], domicile: parte["Domicilio"], sentence: s)
	end
end

