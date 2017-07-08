class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = post.likes.build(like_params)
    like.user = current_user
    like.save
    redirect_to posts_path
  end

  def new

  end

  def like_params
    params.permit(:post_id)
  end
end
