class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination
  validates :title, presence: {message: "Please Add A Title"}
  validates :content, length: {minimum: 100, message: "Post is too short, please write more"}

  def cleanup_post
    output = self.content
    clean_ouput = output.slice(0..-1)
    return clean_ouput
  end

end
