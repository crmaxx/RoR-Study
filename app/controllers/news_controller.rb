class NewsController < ApplicationController
	respond_to :html, :atom

	def index
		@news = News.order("created_at desc")
		respond_with @news		
	end

	def show
		@news  = current_user.news.find_by_id(params[:id])
		respond_with @news
	end

	def new
		@news  = current_user.news.build(params[:news])
		respond_with @news
	end

	def create
		@news  = current_user.news.build(params[:news])
		if @news.save
      		flash[:notice] = "News created!"
      		redirect_to news_index_path	
    	else
      		render 'new'
    	end
			
	end

	def edit
		@news = current_user.news.find_by_id(params[:id])
		respond_with @news
	end

	def update
		@news = current_user.news.find_by_id(params[:id])
		if @news.update_attributes(params[:news])
			flash[:notice] = "News successeful updated"
			redirect_to news_index_path 
		else
			flash[:alert] = "Wrong!!!"
			render "edit"
		end
		
	end

	def destroy
		@news = current_user.news.find_by_id(params[:id])
		@news.destroy
		flash[:notice] = "News successeful deleted"
		respond_with(@news)
	end
end
