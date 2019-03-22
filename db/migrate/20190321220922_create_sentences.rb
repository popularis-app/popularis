class CreateSentences < ActiveRecord::Migration[5.1]
  def change
    create_table :sentences do |t|
      t.string :name
      t.string :entry_point
      t.string :type
      t.date :date
      t.string :institution

      t.timestamps
    end
  end
end
