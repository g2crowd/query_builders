FactoryBot.define do
  factory :campaign, class: 'Campaign' do
    title { Faker::Book.title }
    description { Faker::Quote.fortune_cookie }
    start_date { Time.zone.now }
  end
end
