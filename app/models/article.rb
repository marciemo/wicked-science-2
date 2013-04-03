class Article < ActiveRecord::Base
  has_many :comments

  attr_accessible :title, :author, :link

  validates :title, :author, :link, :presence => true



end