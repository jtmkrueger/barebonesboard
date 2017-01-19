class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
  has_many :posts
  has_many :comments

  self.per_page = 5
end
