class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create
  		#render plain: params[:article].inspect
  		@article = Article.new(article_params)
  		@article.user_id = current_user.id
  		if @article.save
  			flash[:notice] = "Article was successfully created"
  			redirect_to article_path(@article)
  		else
  			render 'new'
  		end
 	end

  	def show
  		@article = Article.find(params[:id])
  	end

  	def edit
  		@article = Article.find(params[:id])
  	end

  	def update
 		  @article = Article.find(params[:id])
  		if @article.update(article_params)
   			flash[:notice] = "Article was updated successfully"
   			redirect_to article_path(@article)
  		else
   			flash[:notice] = "Article was not updated"
   			render 'edit'
  		end
 	end

 	def index
 		@article = Article.all
 	end
 	

 	def destroy
 		@article = Article.find(params[:id])
 		@article.destroy
 			flash[:notice] = "Article was deleted successfully"
 			redirect_to articles_path
 	end

	private
  	def article_params
   		params.require(:article).permit(:title, :description)
  	end

end
