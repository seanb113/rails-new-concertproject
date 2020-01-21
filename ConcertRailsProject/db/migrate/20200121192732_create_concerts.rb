class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.string :name
      t.references :venue, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
