# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


def clean_database
  p 'Deleting old data from the database'
  User.delete_all
  Relationship.delete_all
  p 'done deleting'
end

def seed_dummy_users
    10.times do |i|
        User.create! :name => "Test User #{i}"
    end
end

def add_realationships
    user_1 = User.find 1
    user_2 = User.find 5
    user_1.follow(user_2)
end


p 'Start seeding.....'
clean_database
seed_dummy_users
#add_realationships
p 'Seeding is done.'