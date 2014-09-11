class Post < ActiveRecord::Base
  # TODO: add association to the user model
  belongs_to :user
end
