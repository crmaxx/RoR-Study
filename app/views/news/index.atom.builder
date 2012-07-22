atom_feed do |feed|
	feed.title "News Portal"

	feed.updated @news.all

	@news.each do |news|
		feed.entry(news) do |entry|
			entry.title news.name
			entry.content news.description, :type => ":html"

			user = @users.find_by_id(params[:user_id])

			entry.author do |author|
				author.name user.username
			end
		end
	end 
end