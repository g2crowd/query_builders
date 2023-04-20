require 'rails_helper'
require_relative '../shared_context/characters'

describe Queries::Characters::IndexQuery do
  subject(:query) { described_class.new filters: }

  let(:filters) do
    {}
  end

  include_context 'with full character suite'

  describe '#call' do
    context 'with no filters' do
      it 'returns an ActiveRecord Relation of characters up to the limit size' do
        expect(query.call).to include(*all_characters)
      end
    end

    context 'with spells filters' do
      let(:filters) do
        { spells: { names: ['greater healing', 'lesser healing'] } }
      end

      it 'returns only characters that have one of the spells' do
        expect(query.call).to contain_exactly(spellcaster, the_legend)
      end
    end

    context 'with flaws filters' do
      let(:filters) do
        { flaws: { titles: ['forgetful'] } }
      end

      it 'returns only characters that have one of the flaws' do
        expect(query.call).to contain_exactly(flawed_ranger)
      end
    end

    context 'with virtues filters' do
      let(:filters) do
        { virtues: { titles: ['great strength'] } }
      end

      it 'returns only characters that have one of the virtues' do
        expect(query.call).to contain_exactly(virtuous_paladin)
      end
    end

    context 'with feats filters' do
      let(:filters) do
        { feats: { names: ['dungeoneering'] } }
      end

      it 'returns only characters that have one of the feats' do
        expect(query.call).to contain_exactly(dungeoneer)
      end
    end

    context 'with specializations filters' do
      let(:filters) do
        { specializations: { names: ['Ranger'] } }
      end

      it 'returns only characters that have one of the feats' do
        expect(query.call).to contain_exactly(flawed_ranger)
      end
    end

    context 'with legendary filter' do
      let(:filters) do
        { legendary: true }
      end

      it 'returns only legendary characters' do
        expect(query.call).to contain_exactly(the_legend)
      end
    end
  end
end
