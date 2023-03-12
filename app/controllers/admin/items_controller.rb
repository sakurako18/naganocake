class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @items = item.all
    @item = Item.new(item_params)
    @item.save
    if @item.save
    redirect_to admin_items_show_path(@item.id)
    else
    render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_show_path(@item.id)
  end
end
