class News < ActiveRecord::Base
  attr_accessible :description, :full, :title
  validates_presence_of :description, :full, :title
end
