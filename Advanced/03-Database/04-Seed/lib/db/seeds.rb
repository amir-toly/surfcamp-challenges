require_relative '../config/application'
require_relative '../models/post'
require_relative '../models/user'

require 'faker'
require 'nokogiri'
require 'open-uri'

puts 'Seeding database...'

# TODO: Your code goes here
# 1. create fake users

idx = 0

while idx < 3
  User.create(
    name:   Faker::Name.name,
    email:  Faker::Internet.email)

  idx += 1
end

# 2. Scrape news from https://news.ycombinator.com/ and associate posts to your existing users

doc = Nokogiri::HTML(open('https://news.ycombinator.com/'))#TODO: Set encoding

posts = []

# Search for nodes by xpath
doc.xpath("//tr").each do |tr|
  post = {}

  tr.xpath("td[@class='title' and count(*)=2]/a").each do |name|
    post[:date] = Time.now#TODO: Consider the actual date instead

    post[:name] = name.content
  end

  tr.xpath("td[@class='subtext']/span").each do |rating|
    posts.last[:rating] = rating.content.tr(' points', '').to_i#TODO: What if only 1 point?
  end

  tr.xpath("td[@class='title']/a[not(@rel)]/@href").each do |source_url|
    post[:source_url] = source_url.content

    posts << post
  end
end

users = User.all

posts.each_with_index do |post, index|
  if index < 10
    post[:user] = users[0]
  elsif index < 20
    post[:user] = users[1]
  elsif index < 30
    post[:user] = users[2]
  end

  Post.create(post)
end
