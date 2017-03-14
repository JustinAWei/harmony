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

  def venue
    event = Event.find(params[:id])

    #composer = event.composers.new
    #composer.update(name: params[:event][:artist_name])

    event.update(type_of_program: params[:event][:type_of_program])
    event.update(proof_type: params[:event][:proof_type])
    event.update(venue: params[:event][:venue])
    event.update(venuetype: params[:event][:venuetype])
    event.update(venuecapacity: params[:event][:venuecapacity])
    event.update(venue_phone: params[:event][:venue_phone])
    event.update(venue_website: params[:event][:venue_website])

    event.update(performance_time: params[:event][:performance_time])

    #puts composer.errors.full_messages
    puts event.errors.full_messages

    #LOCATION SHIT
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

    redirect_to root_path
  end


  def setlist
    event = Event.find(params[:id])
    event.update(file: params[:event][:file])
    event.update(fileName: params[:event][:fileName])
    redirect_to root_path
  end

end
