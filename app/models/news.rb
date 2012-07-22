class News < ActiveRecord::Base
  has_many :comments

  attr_accessible :description, :full, :title, :user_id
  validates_presence_of :description, :full, :title
end
