# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Create Topics
10.times do 
  Topic.create!(
    title:  Faker::Lorem.sentence
  )
end

# Create Bookmarks
topics = Topic.all

50.times do
  Bookmark.create!(
    url:    Faker::Internet.url,
    topic:  topics.sample
  )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"

