class ItemsController < ApplicationController

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
        @item.user = User.find(session[:user_id])
        redirect_to trip_path(@item.trip)
    end

    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item = Item.update(item_params)
    end

    def delete
        @item = Item.find(params[:id])
        @item.destroy_all
    end

private

    def item_params
        params.permit(:name, :link, :trip_id)
    end

end
