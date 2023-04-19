require 'rails_helper'
require_relative '../shared_context/campaigns'

describe Queries::Campaigns::IndexQuery do
  subject(:query) { described_class.new filters: }

  let(:filters) do
    {
      characters: characters_filters
    }
  end
  let(:characters_filters) { {} }

  include_context 'with common database records'

  describe '#call' do
    context 'with no filters' do
      it 'returns a list of campaigns up to the limit size' do
        expect(query.call).to eq all_campaigns
      end
    end

    context 'with a specific time window of campaigns' do
      let(:filters) do
        {
          start_date_gteq: 1.day.ago,
          characters: characters_filters
        }
      end

      it 'returns only campaigns with the time window' do
        expect(query.call).to eq(all_campaigns - [old_campaign, older_campaign])
      end
    end

    context 'with a filter for campaigns that include legendary characters' do
      let(:characters_filters) { { legendary: true } }

      it 'returns only campaigns that include a legendary character' do
        expect(query.call).to eq [characters_campaign]
      end
    end
  end
end
