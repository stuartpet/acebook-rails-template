# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post

  def index
  end
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      flash[:success] = "Comment added"
      redirect_back(fallback_location: posts_path)
    else
      flash[:alert] = "Something went wrong!"
      render posts_path
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    if Time.now - @comment.created_at > 1.minutes
      flash[:notice] = 'Too late to edit'
    else
      @comment.update(comment_params)
      flash[:success] = "Comment updated"
      redirect_to  posts_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to  posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
