class TripsController < ApplicationController
    
    def new
        @trip = Trip.new
        @trip.build_location
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
        @trip = Trip.find(params[:id])
        @trip.items.destroy_all
        @trip.posts.destroy_all
        @trip.destroy
        redirect_to '/home'
    end

    def browse
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
        when 'Recent'
            @trips = Trip.by_most_recent
            render :browse
        end
    end

    def search
        s = params[:search].downcase
        case params[:type]
        when 'Select'
            @trips = Trip.all
            render :browse
        when 'Trip Name'
            @trips = Trip.by_specific_name(s)
            render :browse
        when 'Location'
            @trips = Trip.by_one_location(s)
            render :browse
        when 'Category'
            @trips = Trip.by_one_category(s)
            render :browse
        when 'User'
            @trips = Trip.by_specific_user(s)
            render :browse
        end
    end

private

    def trip_params
        params.require(:trip).permit(:name, :description, :category_id, :location_id, :date, location_attributes: [:city, :state])
    end

end
