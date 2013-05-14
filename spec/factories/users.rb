# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    phone "MyString"
    text? false
    provider "MyString"
    onCampus? false
    address "MyString"
  end
end
