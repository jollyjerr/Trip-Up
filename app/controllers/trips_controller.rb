class TripsController < ApplicationController
    
    def new
        @trip = Trip.new
    end

    def create
        @trip = Trip.create(trip_params)
        @trip.users << User.find_by(id: session[:user_id])
        if @trip.save
            redirect_to trip_path(@trip)
        else
            render :new
            @trip.errors.full_messages.each do |msg|
                puts msg
            end
        end
    end

    def show
        require_logged_in
        @trip = Trip.find(params[:id])
    end

    def destroy
        @trip = Trip.find(params[:id]).destroy
        redirect_to '/'
    end

private

    def trip_params
        params.require(:trip).permit(:name, :description, :category_id, :location_id)
    end

end
