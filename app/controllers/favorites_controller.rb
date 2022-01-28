class FavoritesController < ApplicationController

  def create
    #post_image_idだと、Couldn't find PostImage without an ID
    #postimage_idで解決
    post_image = PostImage.find(params[:postimage_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to postimage_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:postimage_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to postimage_path(post_image)
  end

end
