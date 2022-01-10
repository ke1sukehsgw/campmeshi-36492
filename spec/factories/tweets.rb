FactoryBot.define do
  factory :tweet do
    title {'test'}
    body {'test'}
    association :user

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
