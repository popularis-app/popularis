class CreateParts < ActiveRecord::Migration[5.1]
  def change
    create_table :parts do |t|
      t.string :relevance
      t.string :name
      t.string :title
      t.string :category
      t.string :national_id
      t.string :domicile
      t.references :sentence, foreign_key: true

      t.timestamps
    end
  end
end
