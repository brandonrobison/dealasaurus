# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    from "MyString"
    to "MyString"
    message "MyText"
    deal_id 1
  end
end
