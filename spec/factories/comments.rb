FactoryBot.define do
  factory :comment do
    content {'test'}

    association :user
    association :tweet
  end
end
