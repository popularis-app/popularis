class CreateResponsibles < ActiveRecord::Migration[5.1]
  def change
    create_table :responsibles do |t|
      t.string :nombre
      t.string :tipo
      t.references :sentence, foreign_key: true

      t.timestamps
    end
  end
end
