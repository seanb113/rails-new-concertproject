class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.references :artist, foreign_key: true
      t.references :concert, foreign_key: true
      t.boolean :headliner

      t.timestamps
    end
  end
end
