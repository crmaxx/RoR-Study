class CommentsController < ApplicationController
	before_filter do
		@news = News.find_by_id(params[:news_id])
	end

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
