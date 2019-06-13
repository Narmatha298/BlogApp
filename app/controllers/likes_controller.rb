class LikesController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @like = @article.likes.create(user_id: current_user.id)
      @c_user = @current_user
      UserNotifierMailer.send_like_email(@article,@c_user).deliver
    end
    redirect_to article_path(@article)
  end

  def find_like
    @article = Article.find(params[:article_id])
    @like = @article.likes.find(params[:id])
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
  	   @article = Article.find(params[:article_id])
  	   @like = @article.likes.find(params[:id])
       @like.destroy
    end
    redirect_to article_path(@article)
  end

  
  private

  
  def already_liked?
    Like.where(user_id: current_user.id, article_id:
    params[:article_id]).exists?
  end

end