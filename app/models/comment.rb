class Comment < ActiveRecord::Base
   belongs_to :article
  # has_many :comments, as :commentable

  attr_accessible :text, :article_id

  validates :text, :article_id, :presence => true





end