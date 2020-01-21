class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.references :artist_id, foreign_key: true
      t.references :concert_id, foreign_key: true

      t.timestamps
    end
  end
end
