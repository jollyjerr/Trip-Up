class TripsController < ApplicationController
    
    def new
        @trip = Trip.new
    end

    def create 
        author = User.find_by(id: session[:user_id])
        @trip = Trip.new(trip_params)
        @trip.author_id = author.id
        @trip.users << author
        @trip.save
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

    def update
        @trip = Trip.find(params[:id])
        @trip.add_user(User.find_by(id: params[:trip][:user_ids]))
        if @trip.save
            redirect_to trip_path(@trip)
        else
            @trip.errors.full_messages.each do |msg|
                puts msg
            end
        end
    end

    def destroy
        @trip = Trip.find(params[:id]).destroy
        redirect_to '/home'
    end

    def browse
        byebug
        case params[:type]
        when nil
            @trips = Trip.all
            render :browse
        when 'Name'
            @trips = Trip.by_name
            render :browse
        when 'Date'
            @trips = Trip.by_date
            render :browse
        when 'Location'
            @trips = Trip.by_location
            render :browse
        when 'Category'
            @trips = Trip.by_category
            render :browse
        end
    end

private

    def trip_params
        params.require(:trip).permit(:name, :description, :category_id, :location_id, :date)
    end

end
