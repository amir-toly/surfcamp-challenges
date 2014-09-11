class User < ActiveRecord::Base
  # TODO: add associations to the Post model
  has_many :posts
end
