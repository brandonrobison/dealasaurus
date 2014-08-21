# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :deal do
    short_description "MyString"
    budget "MyString"
    needed_by "MyString"
    more_details "MyText"
    user_id 1
  end
end
