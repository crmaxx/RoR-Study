class NewsController < ApplicationController
	respond_to :html, :xml

	def index
		@news = News.order("created_at desc")
		respond_with @news		
	end

	def show
		@news = News.find_by_id(params[:id])
		respond_with @news
	end

	def new
		@news = News.new
		respond_with @news
	end

	def create
		@news = News.new(params[:news])
		if @news.save
			flash[:notice] = "News successeful created"
			redirect_to news_index_path 
		else
			flash[:alert] = "Wrong!!!"
			render "new"
		end		
	end

	def edit
		@news = News.find_by_id(params[:id])
		respond_with @news
	end

	def update
		@news = News.find_by_id(params[:id])
		if @news.update_attributes(params[:news])
			flash[:notice] = "News successeful updated"
			redirect_to news_index_path 
		else
			flash[:alert] = "Wrong!!!"
			render "edit"
		end
		
	end

	def destroy
		@news = News.find_by_id(params[:id])
		@news.destroy
		flash[:notice] = "News successeful deleted"
		respond_with(@news)
	end
end
