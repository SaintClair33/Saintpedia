# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
 
 # Create Wikis
 5.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph,
     private: false
   )
 end

 5.times do
   Wiki.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph,
     private: true
   )
 end
wikis = Wiki.all



 # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'administrator@example.com',
   password: 'helloworld',
   role:     'admin'
 )
 admin.skip_confirmation!
 admin.save!
 
 # Create a moderator
 premium = User.new(
   name:     'Premium User',
   email:    'premium@example.com',
   password: 'helloworld',
   role:     'premium'
 )
 premium.skip_confirmation!
 premium.save!
 
 # Create a member
 standard = User.new(
   name:     'Standard User',
   email:    'standard@example.com',
   password: 'standard'
 )
 standard.skip_confirmation!
 standard.save!

 puts "Seed of DB completed"
 puts "#{Wiki.count} wikis created"
 puts "#{User.count} users created" 
