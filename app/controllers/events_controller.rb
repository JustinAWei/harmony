class EventsController < ApplicationController
  def test
  end


  def json
    event = Event.find(params[:id])

    s = "\"ARTIST_NAME\":\"#{event.composers.first.name}\","
    num_composers = 0
    event.composers.each do |c|
      if num_composers == 0
        num_composers += 1
      end
      s = s + "\n\"OTHER_ARTIST_NAME_#{num_composers}\":\"#{c.name}\","
      num_composers += 1
    end

    c = ""
    event.songs.each do |s|
      c = c + "{ \"ORIGINAL_TITLE\":\"#{s.title}\",\"COMPOSER\":\"#{s.artist}\" },\n"
    end

    js =
    """
{
\"MARIE_NO\":\"#{event.marie_no}\",
\"CANADIAN_PERFORMANCE\":\"#{event.canadian_performance}\",
\"TYPE_OF_PROGRAM\":\"#{event.type_of_program}\",
#{s}
\"PROOF_TYPE\":\"#{event.proof_type}\",
\"DATE_OF_PROGRAM\":\"#{event.date_of_program}\",
\"VENUE\":\"#{event.venue}\",
\"VENUETYPE\":\"#{event.venuetype}\",
\"VENUECAPACITY\":\"#{event.venuecapacity}\",
\"STREET1\":\"#{event.street1}\",
\"CITY\":\"#{event.city}\",
\"PROVINCE\":\"#{event.province}\",
\"POSTAL_CODE\":\"#{event.postal_code}\",
\"COUNTRY\":\"#{event.country}\",
\"VENUE_PHONE\":\"#{event.venue_phone}\",
\"VENUE_WEBSITE\":\"#{event.venue_website}\",
\"PERFORMANCE_TIME\":\"#{event.performance_time}\",
\"PROMOTER\":\"#{event.promoter}\",
\"PROMOTER_STREET1\":\"#{event.promoter_street1}\",
\"PROMOTER_CITY\":\"#{event.promoter_city}\",
\"PROMOTER_PROVINCE\":\"#{event.promoter_province}\",
\"PROMOTER_POSTAL_CODE\":\"#{event.promoter_postal_code}\",
\"PROMOTER_COUNTRY\":\"#{event.promoter_country}\",
\"PROMOTER_TELEPHONE\":\"#{event.promoter_telephone}\",
\"compositions\":[
#{c}]
}

    """
    render text: js
  end

  def endpoint
    @arr = []

    Event.all.each do |e|
      puts 'location:'
      puts e.location
      @arr.push(e.location)
    end
    render json: @arr
  end

  def dashboard
    @events = Event.all
  end

  def map
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
    event.update(location: params[:event][:location])
    address = Geokit::Geocoders::GoogleGeocoder.reverse_geocode(event.location).full_address.split(',')

    event.update(street1: address[0])
    #puts address[0]
    event.update(city: address[1][1..-1])
    #puts address[1]

    state_zip = address[2].split()
    #puts state_zip[0]
    event.update(province: state_zip[0])
    #puts state_zip[1]
    event.update(postal_code: state_zip[1])

    event.update(country: address[3][1..-1])
    #puts address[3]

    canadian = 'NC'

    if address[3] == 'CAN'
      canadian = 'C'
    end

    event.update(canadian_performance: canadian)

    event.update(date_of_program: event.updated_at.strftime("%D"))

    #puts event.updated_at.strftime("%D")
    event.update(performance_time: event.updated_at.strftime("%R:%M:%S %p"))

    #puts event.updated_at.strftime("%l:%M:%S %p")
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
