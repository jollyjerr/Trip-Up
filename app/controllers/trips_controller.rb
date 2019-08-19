class TripsController < ApplicationController
    
    def new
        @trip = Trip.new
    end

    def create
        @trip = Trip.create(trip_params)
        @trip.users << User.find_by(id: session[:user_id])
        if @trip.save
            redirect_to trip_path(@path)
        else
            render :new
            @trip.errors.full_messages.each do |msg|
                puts msg
            end
        end
    end

    def show
        @trip = Trip.find(params[:id])
    end

private

    def trip_params
        params.require(:trip).permit(:name, :description, :category_id, :location_id)
    end

end
