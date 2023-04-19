FactoryBot.define do
  factory :flaw, class: 'Flaw' do
    title { 'forgetful' }
    description { '-2 to memory' }
    modify_strength { -2 }
  end
end
