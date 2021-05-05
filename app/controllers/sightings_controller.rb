class SightingsController < ApplicationController
    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: sighting
    # end


# To include bird and location information in this controller action
# , now that our models are connected, the most direct way would be 
# to build a custom hash like we did in the previous lesson:

    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    # end


    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(include: [:bird, :location])
        else
            render json: { message: 'No sighting found with that id' }
        end
    end
    
    def index
        sightings = Sighting.all
        render json: sightings, include: [:bird, :location]
    end
end
