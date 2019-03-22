class CreateSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :sentences do |t|
      t.string :nombre
      t.string :entrada
      t.string :tipo
      t.date :fecha
      t.string :institucion

      t.timestamps
    end
  end
end
