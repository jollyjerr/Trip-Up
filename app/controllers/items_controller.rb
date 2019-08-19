class ItemsController < ApplicationController
    validates :name, presence: true

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
    end

private

    def item_params
        params.require(:item).permit(:name, :link)
    end

end
