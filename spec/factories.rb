FactoryBot.define do
  factory :user do
    email("user@user.com")
    password("password")
    password_confirmation("password")
  end

  factory :product do
    user
    name("product")
    description("description")
    price(20)
  end

  factory :review do
    association :user, factory: :user, name: "name", email: "user@user.com"
    product
    content("review")
  end

end