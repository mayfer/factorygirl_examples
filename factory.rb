require 'active_record'
require 'factory_girl'
require './db'

class User < ActiveRecord::Base
    validates :email, { uniqueness: true }
    has_many :complaints
end

class Complaint < ActiveRecord::Base
    belongs_to :user
end

FactoryGirl.define do
    sequence :email do |n|
      "person#{n}@example.com"
    end

    factory :user do
        name "Murat"
        email { generate :email }
        phone "778-858-8449"
    end
end

FactoryGirl.define do
    factory :complaint do
        message "this sucks"
        association :user, factory: :user
    end
end

# User.create => User instance
# FactoryGirl.create(:user) => User instance

# puts FactoryGirl.create(:user).email
# puts User.create(name: "Murat", phone: "778-858-8449", email: "murat@ayfer.net").email

puts FactoryGirl.create(:complaint).message
puts FactoryGirl.create(:user, name: "Gordon").email

user = FactoryGirl.build(:user)
user.save
