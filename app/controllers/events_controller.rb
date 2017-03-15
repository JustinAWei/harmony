class EventsController < ApplicationController
  def test
  end

  def create
    event = Event.new
    event.update(marie_no: params[:event][:marie_no])
    event.save

    render json: {
      id: event.id
    }

  end

  def composer
    event = Event.find(params[:id])
    composer = event.composers.new
    composer.update(name: params[:event][:artist_name])
    composer.save
    redirect_to root_path
  end

  def venue
    event = Event.find(params[:id])

    event.update(type_of_program: params[:event][:type_of_program])
    event.update(proof_type: params[:event][:proof_type])
    event.update(venue: params[:event][:venue])
    event.update(venuetype: params[:event][:venuetype])
    event.update(venuecapacity: params[:event][:venuecapacity])
    event.update(venue_phone: params[:event][:venue_phone])
    event.update(venue_website: params[:event][:venue_website])
    event.save

    redirect_to root_path
  end

  def geomap
    event = Event.find(params[:id])
    address = Geokit::Geocoders::GoogleGeocoder.reverse_geocode(params[:event][:location]).full_address.split(',')

    event.update(street1: address[0])
    event.update(city: address[1])

    state_zip = address[2].split()
    event.update(province: state_zip[0])
    event.update(postal_code: state_zip[1])

    event.update(country: address[3])

    canadian = 'NC'

    if address[3] == 'CAN'
      canadian = 'C'
    end

    event.update(canadian_performance: canadian)

    event.update(performance_time: params[:event][:performance_time])
    date_of_program
    event.update(performance_time: event.updated_at.strftime("%l:%M:%S %p"))
    puts event.updated_at.strftime("%l:%M:%S %p")
    redirect_to root_path
  end

  def promoter
    event = Event.find(params[:id])

    event.update(promoter: params[:event][:promoter])
    event.update(promoter_street1: params[:event][:promoter_street1])
    event.update(promoter_city: params[:event][:promoter_city])
    event.update(promoter_province: params[:event][:promoter_province])
    event.update(promoter_postal_code: params[:event][:promoter_postal_code])
    event.update(promoter_country: params[:event][:promoter_country])
    event.update(promoter_telephone: params[:event][:promoter_telephone])
    event.save

    redirect_to root_path
  end


  def setlist
    event = Event.find(params[:id])
    event.update(file: params[:event][:file])
    event.update(fileName: params[:event][:fileName])
    event.save
    redirect_to root_path
  end

  def song
    event = Event.find(params[:id])
    song = event.songs.new
    song.update(title: params[:event][:title])
    song.update(artist: params[:event][:artist])
    song.save
    redirect_to root_path
  end
end
