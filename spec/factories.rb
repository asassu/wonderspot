FactoryGirl.define do
  factory :user do
    name     "Fluffy"
    email    "m@example.com"
    password "qwerty"
    password_confirmation "qwerty"
  end
end
