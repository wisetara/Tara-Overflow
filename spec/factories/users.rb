# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Tara"
    email "tara@example.com"
    username "taragirl"
    password "Elephant123"
    password_confirmation "Elephant123"
  end
end
