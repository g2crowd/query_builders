RSpec.shared_context 'with common database records' do
  let!(:specified_campaign) { create(:campaign, title: 'The adventures of Stinky') }
  let!(:generic_campaign) { create(:campaign) }
  let!(:old_campaign) { create(:campaign, start_date: 2.years.ago) }
  let!(:older_campaign) { create(:campaign, start_date: 10.years.ago) }
  let!(:characters_campaign) { create(:campaign) }

  let!(:normal_character) { create(:character, campaign: characters_campaign) }
  let!(:legendary_character) { create(:character, :legendary, campaign: characters_campaign) }
  let(:all_campaigns) do
    [specified_campaign, generic_campaign, old_campaign, older_campaign, characters_campaign]
  end
end
