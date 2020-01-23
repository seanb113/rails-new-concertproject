class AddLocationToVenue < ActiveRecord::Migration[5.0]
  def change
    add_reference :venues, :location, foreign_key: true
  end
end
