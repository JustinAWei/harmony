class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

      t.references :requests, foreign_key:true
      #date, location
      t.string :canadian_performance
      t.string :date_of_program
      t.string :street1
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :country

      #marie no
      t.string :marie_no

      #venue
      t.string :type_of_program
      t.string :artist_name
      t.string :proof_type
      t.string :venue
      t.string :venuetype
      t.string :venuecapacity
      t.string :venue_phone
      t.string :venue_website
      t.string :performance_time

      #promoter info
      t.string :promoter
      t.string :promoter_street1
      t.string :promoter_city
      t.string :promoter_province
      t.string :promoter_postal_code
      t.string :promoter_country
      t.string :promoter_telephone

      t.timestamps
    end
  end
end
