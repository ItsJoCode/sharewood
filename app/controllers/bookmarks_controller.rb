class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    redirect_to sales_path
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to sales_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:sale_id, :user_id)
  end
end
