class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, presence: true, uniqueness: {message: "Blogger Name Already Taken"}
  validate :non_zero
  validates :bio, length: {minimum: 30, message: "Bio too short"}

def non_zero
  if self.age == 0
     self.errors.add(:age, "Age must be greater than zero")
  end
end

def all_likes
  liked_count = 0
  liked_posts = self.posts
  if liked_posts.empty?
    return "This blogger hasn't made any posts yet"
  end
  liked_posts.each do |post|
    liked_count += post.likes
  end
  return liked_count
end

def most_liked_post
  liked_posts = self.posts
  most_liked_post = liked_posts.sort_by{|post| post.likes}[-1]
  return most_liked_post
end

end
