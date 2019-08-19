class ItemsController < ApplicationController
    validates :name, presence: true

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
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
        params.require(:item).permit(:name, :link)
    end

end
