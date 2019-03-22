class CreateBodies < ActiveRecord::Migration[5.1]
  def change
    create_table :bodies do |t|
      t.string :category
      t.string :content
      t.integer :number
      t.references :sentence, foreign_key: true

      t.timestamps
    end
  end
end
