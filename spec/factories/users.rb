# Read about factories at https://github.com/thoughtbot/factory_girl
# in curly braces because it's dynamically generated.
# Faker::Internet is class, .password is method
FactoryGirl.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    password_confirmation {password}
  end

end
