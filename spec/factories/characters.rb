FactoryBot.define do
  factory :character, class: 'Character' do
    name { Faker::FunnyName.name }
    experience { 1000 }
    size { 'medium' }
    species { 'dwarf' }
    strength { 10 }
    agility { 10 }
    health { 10 }
    reasoning { 10 }
    memory { 10 }
    intuition { 10 }
    beauty { 10 }

    trait :legendary do
      strength { 18 }
      experience { 15000 }
    end

    trait :with_campaign do
      campaign
    end
  end
end
