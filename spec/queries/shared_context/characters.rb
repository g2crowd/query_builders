RSpec.shared_context 'with full character suite' do
  let(:newbie) { create(:character) }
  let(:spellcaster) { create(:character) }
  let(:flawed_ranger) { create(:character) }
  let(:virtuous_paladin) { create(:character) }
  let(:dungeoneer) { create(:character) }
  let(:the_legend) { create(:character, :legendary) }

  let!(:all_characters) do
    [newbie, spellcaster, flawed_ranger, virtuous_paladin, dungeoneer, the_legend]
  end

  let(:greater_spell) { create(:spell, name: 'greater healing', level: 4) }
  let(:lesser_spell) { create(:spell, name: 'lesser healing', level: 2) }
  let(:dungeoneer_feat) { create(:feat, name: 'dungeoneering') }
  let(:virtue) { create(:virtue, title: 'great strength') }
  let(:flaw) { create(:flaw, title: 'forgetful') }
  let(:specialization) { create(:specialization, name: 'Ranger') }

  let!(:characters_spell1) { CharactersSpell.create(character: spellcaster, spell: greater_spell) }
  let!(:characters_spell2) { CharactersSpell.create(character: the_legend, spell: lesser_spell) }
  let!(:characters_feat) { CharactersFeat.create(character: dungeoneer, feat: dungeoneer_feat) }
  let!(:characters_virtue) { CharactersVirtue.create(character: virtuous_paladin, virtue: virtue) }
  let!(:characters_flaw) { CharactersFlaw.create(character: flawed_ranger, flaw: flaw) }
  let!(:characters_specialization) { CharactersSpecialization.create(character: flawed_ranger, specialization:) }
end
