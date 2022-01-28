class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:postimage_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to postimage_path(post_image)
  end

  def destroy
    #Couldn't find PostComment with 'id'=1
    #show.html.erbの記述が <%= link_to "削除", postimage_post_comment_path(post_comment), method: :delete %>になってた
    #正しくは、 <%= link_to "削除", postimage_post_comment_path(post_comment.post_image , post_comment), method: :delete %>
    PostComment.find(params[:id]).destroy
    redirect_to postimage_path(params[:postimage_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
