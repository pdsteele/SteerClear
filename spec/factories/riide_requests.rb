# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :riide_request do
    name "MyString"
    phone "MyString"
    text false
    shift_id 1
    state "MyString"
    partySize 1
    pickUpTime "2013-05-24 21:42:21"
    dropOffTime "2013-05-24 21:42:21"
    waitTime 1.5
    pickupAddress "MyString"
    pickupOnCampus false
    pickupLong 1.5
    pickupLat 1.5
    destAddress "MyString"
    destOnCampus false
    destLong 1.5
    destLat 1.5
    user_id 1
  end
end
