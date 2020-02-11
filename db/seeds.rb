# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'purging database'

Ethic.destroy_all
Civic.destroy_all
Trait.destroy_all
Government.destroy_all

p 'creating ethics'

ethics_array = StellarisWikiScraper.new.ethics_scraper
SeedPopulator.new(ethics_array).ethics_creator

p 'creating Standard civics'

civics_array = StellarisWikiScraper.new.civics_scraper(0, 6)
SeedPopulator.new(civics_array, 'standard').civics_creator

p 'creating Corporate civics'

civics_array = StellarisWikiScraper.new.civics_scraper(2, 4)
SeedPopulator.new(civics_array, 'corporate').civics_creator

p 'creating Hive Mind civics'

civics_array = StellarisWikiScraper.new.civics_scraper(3, 4)
SeedPopulator.new(civics_array, 'hive').civics_creator

p 'creating Machine Intelligence civics'

civics_array = StellarisWikiScraper.new.civics_scraper(4, 4)
SeedPopulator.new(civics_array, 'machine').civics_creator

p 'creating standard and biological traits'

traits_array = StellarisWikiScraper.new.traits_scraper(0, 7)
SeedPopulator.new(traits_array).traits_creator

p 'creating hive minded trait'
Trait.create!(
  name: 'Hive-Minded',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/7/7d/Hive-minded.png/29px-Hive-minded.png',
  effects: 'Not Affected by Happiness',
  value: 0,
  description: 'This species is made up of semi-autonomous individuals slaved to a single, unfathomably vast consciousness.',
  group: 'biological'
)

p 'creating lithoid traits'

traits_array = StellarisWikiScraper.new.traits_scraper(1, 6)
SeedPopulator.new(traits_array, 'lithoid').traits_creator

p 'creating robotic traits'

traits_array = StellarisWikiScraper.new.traits_scraper(-1, 8)
SeedPopulator.new(traits_array, 'robotic').traits_creator

p 'creating governments'

governments_array = StellarisWikiScraper.new.governments_scraper
SeedPopulator.new(governments_array).governments_creator

p 'database population completed'
