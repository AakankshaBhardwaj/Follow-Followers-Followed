Factory.define :user do |user|
    user.name "Test User"
end

Factory.sequence :name do |n|
    "Test User #{n}" 
end