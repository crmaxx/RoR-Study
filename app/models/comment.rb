class Comment < ActiveRecord::Base
  attr_accessible :body, :news_id, :user_id

  belongs_to :news
end
