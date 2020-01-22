class CreateFavoriteVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_venues do |t|
      t.references :user, foreign_key: true
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
