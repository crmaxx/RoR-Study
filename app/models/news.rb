class News < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :users

  attr_accessible :description, :full, :title, :user_id
  validates_presence_of :description, :full, :title
end
