class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_liked_post
    blog_posts = self.posts
    if blog_posts.count > 1
      non_nil_likes = blog_posts.select {|post| post.likes != nil}
      most_liked = non_nil_likes.sort_by {|post| post.likes}.last
    else
      most_liked = blog_posts[0]
    end
    return most_liked
  end

  def most_recent_posts
    blog_posts = self.posts
    if blog_posts.count >= 5
      most_recent = blog_posts.sort_by {|post| post.created_at}[-5..-1]
    else
      most_recent = blog_posts
    end
    return most_recent
  end

  def bloggers_age
    age_total = 0
    if self.bloggers.empty?
      blogger_age = "No Bloggers Posted Have Yet For This Destination"
      return blogger_age
    else
      uniq_bloggers = self.bloggers.uniq
      uniq_bloggers.each do |blogger|
          age_total += blogger.age
      end
       blogger_age = age_total/self.bloggers.count
     end
    return blogger_age
  end

end
