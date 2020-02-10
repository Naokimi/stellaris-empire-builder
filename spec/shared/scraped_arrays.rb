RSpec.shared_context 'scraped arrays' do
  let(:standard_civics_array) { StellarisWikiScraper.new.civics_scraper(0, 6) }
  let(:corporate_civics_array) { StellarisWikiScraper.new.civics_scraper(2, 4) }
  let(:hive_civics_array) { StellarisWikiScraper.new.civics_scraper(3, 4) }
  let(:machine_civics_array) { StellarisWikiScraper.new.civics_scraper(4, 4) }
  let(:standard_civic) { SeedPopulator.new([], 'standard').civic_reader(standard_civics_array.first) }
  let(:corporate_civic) { SeedPopulator.new([], 'corporate').civic_reader(corporate_civics_array.first) }

  let(:ethics_array) { StellarisWikiScraper.new.ethics_scraper }
  let(:ethic) { SeedPopulator.new([]).ethic_reader(ethics_array.first) }
end
