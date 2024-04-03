FactoryBot.define do
  factory :quote do
    name { Faker::Quote.fortune_cookie }
  end
end

# FactoryBot.define do
#   factory :quote do
#     name { "MyString" }
#   end
# end
