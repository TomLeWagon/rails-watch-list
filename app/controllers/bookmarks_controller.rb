class BookmarksController < ApplicationController

  def new
    # we need @list in our `simple_form_for`
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    # @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
