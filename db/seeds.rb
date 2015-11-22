# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
require 'httparty'

categories = CSV.read('db/data/ethnic-group.csv')

categories.each do |row|
  c = Category.create(name: row[1])
  puts c.inspect
end

(1..10).each do |num|
  url = "https://idfy.0x10.info/api/idfy-status?type=json&query=list_member&page=#{num}"
  response = HTTParty.get url
  sleep(1)
  response["members"].each do |member|
    # TODO: Use metaprogramming to improve this.
    user = User.new
    user.dob = member["dob"] if member["dob"].present?
    user.status = member["status"] if member["status"].present?
    user.category_id = member["ethnicity"] if member["ethnicity"].present?
    user.weight = member["weight"] if member["weight"].present?
    user.height = member["height"] if member["height"].present?
    user.is_veg = member["is_veg"].try(:to_i) == 1 ? true : false
    user.drink = member["drink"].try(:to_i) == 1 ? true : false
    user.remote_image_url = member["image"] if member["image"].present?
    user.email = Faker::Internet.email
    user.password = "testing"
    user.save
    puts user.inspect
  end
end
