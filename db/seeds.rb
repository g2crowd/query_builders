size_proc = proc { %w(tiny small medium large).sample }
stat_proc = proc { (8..18).to_a.sample }
exp_proc = proc { [0, 0.2, 0.5, 1, 2, 3].sample * rand(10000) }
measurements_proc = proc do
  height = 4 + (rand * 3)
  weight = 20 * height + (rand * 25 * height)
  { height:, weight: }
end
genders_proc = proc do
  (%w(male male male male female female female female) + [nil]).sample || Faker::Gender.type
end

100.times do
  Campaign.create do |c|
    c.title = "#{Faker::Book.title}"
    c.description = Faker::Quote.fortune_cookie
    c.start_date = (rand * 1000).days.ago
  end
end

campaign_ids = Campaign.all.pluck(:id)

500.times do
  Character.create do |c|
    c.campaign_id = campaign_ids.sample
    c.name = Faker::FunnyName.name
    c.age = 16 + ([0, 1, 1, 1, 1, 2, 2, 3].sample * rand(20))
    c.gender = genders_proc.call
    c.size = size_proc.call
    c.species = Faker::Games::DnD.race

    measurements = measurements_proc.call

    c.height = measurements[:height]
    c.weight = measurements[:weight]

    c.experience = exp_proc.call

    %w(strength agility health reasoning memory intuition beauty).each do |stat|
      num = stat_proc.call
      c.send("#{stat}=", num)
    end
  end
end

feat_name_proc = proc do
  adj = Faker::Adjective.positive
  verb = %w(fighting devling dodging exploring casting defending fleeing bartering healing speaking).sample
  "#{adj} #{verb}"
end

30.times do
  Feat.create do |f|
    f.name = feat_name_proc.call
    f.description = Faker::Quote.fortune_cookie
  end
end

attributes = %w(strength agility health reasoning memory intuition beauty)

modify_stat_proc = proc do |operand|
  operand ||= "+"
  0.send(operand, rand(4))
rescue ZeroDivisionError
  0
end

flaw_proc = proc do
  adj = Faker::Adjective.negative
  attr = attributes.sample
  mod = modify_stat_proc.call(:-)
  { attr:, title: "#{adj} #{attr}", mod:}
end

100.times do
  Flaw.create do |f|
    attrs = flaw_proc.call
    mod = attrs[:mod]
    attr = attrs[:attr]

    f.title = attrs[:title]
    f.send("modify_#{attr}=", mod)
    f.description = Faker::Quote.fortune_cookie
  end
end

virtue_proc = proc do
  adj = Faker::Adjective.positive
  attr = attributes.sample
  mod = modify_stat_proc.call(:+)
  { attr:, title: "#{adj} #{attr}", mod:}
end

100.times do
  Virtue.create do |f|
    attrs = virtue_proc.call
    mod = attrs[:mod]
    attr = attrs[:attr]

    f.title = attrs[:title]
    f.send("modify_#{attr}=", mod)
    f.description = Faker::Quote.fortune_cookie
  end
end

flaw_ids = Flaw.all.pluck(:id)
feat_ids = Feat.all.pluck(:id)
virtue_ids = Virtue.all.pluck(:id)

Character.all.find_each do |character|
  character_id = character.id
  CharactersFeat.create(character_id:, feat_id: feat_ids.sample)
  CharactersVirtue.create(character_id:, virtue_id: virtue_ids.sample)
  CharactersFlaw.create(character_id:, flaw_id: flaw_ids.sample)
end

adj1 = %w(lesser standard plus_one plus_two greater greatest)
adj2 = %w(bronze iron gold mithril glass dragonscale silver)
potion_names = %w(invisibility strength agility health memory intuition reasoning beauty healing resistance dodging)
armor_names = %w(helmet shield breastplate chainmail leggins greaves)
weapon_names = %w(sword spear longbow shortbow crossbow greatsword dagger axe greataxe lance)

adj1.each do |modifier|
  adj2.each do |material|
    weapon_names.each do |type|
      name = "#{modifier} #{material} #{type}"
      Item.create(name:, equippable: true, weapon: true)
    end
  end
end

adj1.each do |modifier|
  adj2.each do |material|
    armor_names.each do |type|
      name = "#{modifier} #{material} #{type}"
      Item.create(name:, equippable: true, armor: true)
    end
  end
end

adj1.each do |modifier|
  potion_names.each do |type|
    name = "#{modifier} potion of #{type}"
    Item.create(name:, consummable: true)
  end
end

weapons_ids = Item.where(weapon: true).pluck(:id)
armors_ids = Item.where(armor: true).pluck(:id)
potions_ids = Item.where(consummable: true).pluck(:id)

spell_names = %w(warding healing summoning transformation fire ice lightning illusion)
adj1 = %w(lesser minor power greater masterful legendary)

spell_names.each do |type|
  adj1.each.with_index(1) do |mod, idx|
    name = "#{mod} spell of #{type}"
    Spell.create(name: name, description: name, level: idx)
  end
end

spell_ids = Spell.all.pluck(:id)

Character.all.find_each do |c|
  character_id = c.id

  CharactersSpell.create(spell_id: spell_ids.sample, character_id:)
  CharactersSpell.find_or_create_by(spell_id: spell_ids.sample, character_id:)

  inventory = Inventory.create(character_id:)
  inventory_id = inventory.id

  InventoriesItem.create(inventory_id:, item_id: weapons_ids.sample)
  InventoriesItem.create(inventory_id:, item_id: armors_ids.sample)
  InventoriesItem.find_or_create_by(inventory_id:, item_id: armors_ids.sample)
  InventoriesItem.create(inventory_id:, item_id: weapons_ids.sample)
  InventoriesItem.create(inventory_id:, item_id: potions_ids.sample)
  InventoriesItem.create(inventory_id:, item_id: potions_ids.sample)
end
