class EventsController < ApplicationController
  def test
  end

  def create
    event = Event.new
    event.marie_no = params[:marie_no]
    event.save

    render json: {
      id: event.id
    }

  end

  def venue
    event = Event.find(params[:id])
    event.composers.create(params[:artist_name])

    event.type_of_program = params[:type_of_program]
    event.proof_type = params[:proof_type]
    event.venue = params[:venueType]
    event.venuecapacity = params[:venuecapacity]
    event.venue_phone = params[:venue_phone]
    event.venue_website = params[:venue_website]

    event.performance_time = params[:performance_time]

    #LOCATION SHIT

    event.save
  end

  def promoter
    event = Event.find(params[:id])
    event.promoter = params[:promoter]
    event.promoter_street1 = params[:promoter_street1]
    event.promoter_city = params[:promoter_city]
    event.promoter_province = params[:promoter_province]
    event.promoter_postal_code = params[:promoter_postal_code]
    event.promoter_country = params[:promoter_country]
    event.promoter_telephone = params[:promoter_telephone]

    event.save
  end


  def setlist
  end

end
