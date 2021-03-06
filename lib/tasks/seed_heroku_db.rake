require 'csv'
require 'httparty'

namespace :heroku do
  desc "Seed heroku db"
  task :import_categories => :environment do
    categories = CSV.read('db/data/ethnic-group.csv')

    categories.each do |row|
      c = Category.create(name: row[1])
      puts c.inspect
    end
  end

  desc "import users"
  task :import_users => :environment do
    (1..10).each do |num|
      url = "https://idfy.0x10.info/api/idfy-status?type=json&query=list_member&page=#{num}"
      response = HTTParty.get url
      sleep(10)
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
        # FIXME: Use S3 for attachment
        user.image = member["image"] if member["image"].present?
        user.email = Faker::Internet.email
        user.password = "testing"
        user.save
        puts user.inspect
      end
    end
  end
end
