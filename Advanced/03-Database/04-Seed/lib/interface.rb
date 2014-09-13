require_relative 'config/application'
require_relative 'models/post'
require_relative 'models/user'

# TODO: build your interface with login and CRUD tasks on the posts

def ask(prompt)
  print "#{prompt} "
  gets.to_s.chomp
end

def create_post(user)
  name = ask('Name:')
  source_url = ask('Source URL:')
  rating = ask('Rating:')
  post_params = { name: name, source_url: source_url, date: Time.now, rating: rating }

  # TODO: use ActiveRecord to add a new post for the user logged in!
  post_params[:user_id] = user.id
  Post.create(post_params)
end

def list_posts(user)
  # TODO: use ActiveRecord to get all posts of the current user
  posts = Post.where(user_id: user.id)

  puts '-' * 50
  puts '%-3s %-100s %-150s %-30s %s' % ['#', 'Name', 'Source URL', 'Created At', 'Rating']

  posts.each do |post|
    puts '%-3d %-100s %-150s %-30s %d' % [post.id, post.name, post.source_url, post.date, post.rating]
  end

  puts '-' * 50
end

def list_users
  users = User.all

  puts '-' * 50
  puts '%-3s %-30s %-50s' % ['#', 'Name', 'Email']

  users.each do |user|
    puts '%-3d %-30s %-50s' % [user.id, user.name, user.email]
  end

  puts '-' * 50
end

def delete_posts(user)
  # TODO: use ActiveRecord to delete all posts of current user
  posts = Post.where(user_id: user.id)
  posts.destroy_all
end

user = nil

while true

  until user
    puts 'Please login with your <email>'
    list_users

    user = User.find_by_email(ask('>'))
  end

  puts "Hey #{user.name}, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Exit"

  case ask('>').to_i
  when 1 then create_post(user)
  when 2 then list_posts(user)
  when 3 then delete_posts(user)
  when 4 then break
  end
end
