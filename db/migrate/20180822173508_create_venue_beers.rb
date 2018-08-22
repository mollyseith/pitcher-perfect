class CreateVenueBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :venue_beers do |t|
      t.belongs_to :venue, foreign_key: true
      t.belongs_to :beer, foreign_key: true
    end
  end
end
