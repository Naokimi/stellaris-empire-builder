RSpec.shared_context 'scraped arrays' do
  let(:ethics_array) { StellarisWikiScraper.new.ethics_scraper }
  let(:ethic) { SeedPopulator.new([]).ethic_reader(ethics_array.first) }
end
