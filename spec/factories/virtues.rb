FactoryBot.define do
  factory :virtue, class: 'Virtue' do
    title { 'great strength' }
    description { '+2 to strength' }
    modify_strength { 2 }
  end
end
