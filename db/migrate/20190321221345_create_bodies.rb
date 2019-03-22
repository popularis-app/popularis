class CreateBodies < ActiveRecord::Migration[5.1]
  def change
    create_table :bodies do |t|
      t.string :tipo
      t.string :contenido
      t.integer :numero
      t.references :sentence, foreign_key: true

      t.timestamps
    end
  end
end
