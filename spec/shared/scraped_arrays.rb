RSpec.shared_context 'scraped arrays' do
  let(:standard_civics_array) { StellarisWikiScraper.new.civics_scraper(0, 6) }
  let(:corporate_civics_array) { StellarisWikiScraper.new.civics_scraper(1, 4) }
  let(:hive_civics_array) { StellarisWikiScraper.new.civics_scraper(2, 4) }
  let(:machine_civics_array) { StellarisWikiScraper.new.civics_scraper(3, 4) }
  let(:standard_civic) { SeedPopulator.new([], 'standard').civic_reader(standard_civics_array.first) }
  let(:corporate_civic) { SeedPopulator.new([], 'corporate').civic_reader(corporate_civics_array.first) }

  let(:ethics_array) { StellarisWikiScraper.new.ethics_scraper }
  let(:ethic) { SeedPopulator.new([]).ethic_reader(ethics_array.first) }

  let(:governments_array) { StellarisWikiScraper.new.governments_scraper }
  let(:government) { SeedPopulator.new([]).government_reader(governments_array.first) }

  let(:origins_array) { StellarisWikiScraper.new.origins_scraper }
  let(:origin) { SeedPopulator.new([]).origin_reader(origins_array.first) }

  let(:standard_traits_array) { StellarisWikiScraper.new.traits_scraper(0, 7) }
  let(:lithoid_traits_array) { StellarisWikiScraper.new.traits_scraper(1, 6) }
  let(:robotic_traits_array) { StellarisWikiScraper.new.traits_scraper(-1, 8) }
  let(:biological_trait) { SeedPopulator.new([]).standard_trait_reader(standard_traits_array.first) }
  let(:lithoid_trait) { SeedPopulator.new([], 'lithoid').lithoid_trait_reader(lithoid_traits_array.second) }
  let(:robotic_trait) { SeedPopulator.new([], 'robotic').robotic_trait_reader(robotic_traits_array.second) }
end
