class CommentsController < ApplicationController
	before_filter do
		@news = current_user.news.find_by_id(params[:news_id])
	end

	#def new
  	#	@news = Subdomain.new(:user => @user)
  	#	respond_with(@news)
  	#end

	def create
		@news.comments.create(params[:comment])
		redirect_to @news
	end

	def destroy
		comment = Comment.find_by_id(params[:id])
		comment.destroy
		flash[:notice] = "Comment successeful deleted"
		redirect_to @news
	end
end
