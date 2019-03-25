class CreateNotifieds < ActiveRecord::Migration[5.1]
  def change
    create_table :notifieds do |t|
      t.string :title
      t.string :name
      t.integer :number
      t.references :sentence, foreign_key: true

      t.timestamps
    end
  end
end
