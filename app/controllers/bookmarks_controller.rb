class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @list.save
      redirect_to list_path(@list)
    else
      render 'list/show'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
