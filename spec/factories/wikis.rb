FactoryGirl.define do
  factory :wiki do
    title Faker::HitchhikersGuideToTheGalaxy.location
    body Faker::HitchhikersGuideToTheGalaxy.quote
    private false
    user nil
  end
end
