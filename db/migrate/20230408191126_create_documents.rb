class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :attachment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
