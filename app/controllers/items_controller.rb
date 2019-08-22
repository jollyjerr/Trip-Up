class ItemsController < ApplicationController

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
        @item[:link] = "https://www.amazon.com/s?k=#{@item[:name]}"
        @item.user = User.find(session[:user_id])
        if @item.save
            redirect_to trip_path(@item.trip_id)
        else
            @item.errors.full_messages.each do |msg|
                puts msg
            end
        end
    end

    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.update(item_params)
    end

    def destroy
        id = Item.find_by(id: params[:id]).trip_id
        Item.find_by(id: params[:id]).destroy
        redirect_to trip_path(id)
    end

private

    def item_params
        params.permit(:name, :link, :trip_id)
    end

end
