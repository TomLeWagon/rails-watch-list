class ListsController < ApplicationController
  before_action :findList, only: [:show, :update, :edit, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new # needed to instantiate the form_for
  end

  def create
    @list = List.new(list_params)
    @list.save

    if @list.save
      # no need for app/views/lists/create.html.erb
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def findList
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
