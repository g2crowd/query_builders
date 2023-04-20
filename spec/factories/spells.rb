FactoryBot.define do
  factory :spell, class: 'Spell' do
    name { 'greater illusion' }
    description { 'produces a powerful illusion effect' }
    level { 4 }
  end
end
