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
# => ["/images/thumb/1/1f/Civic_agrarian_idyll.png/50px-Civic_agrarian_idyll.png", "Agrarian Idyll", "+1 housing from Generator, Mining and Agriculture districts\n −1 housing from City Districts\n Farmers also produce  +2 amenities\n Cannnot pick  Arcology Project ascension perk", "Pacifist\n Syncretic Evolution\n Slaver Guilds\n Post-Apocalyptic", "A simple and peaceful life can often be the most rewarding. This agrarian society has, to a large extent, managed to avoid large-scale urbanization.", ""]
civics_array.each do |civic|
  Civic.create!(
    name: civic.second,
    icon: wiki_url + civic.first,
    effects: civic.third,
    description: civic.fifth,
    type: 'standard'
  )
end

p 'creating Corporate civics'

civics_array = StellarisWikiScraper.new.civics_scraper(2, 4)
# => ["/images/5/5d/Civic_brand_loyalty.png", "Brand Loyalty", "+15% Monthly Unity", "This Megacorporation has fostered a great sense of brand loyalty among its internal consumer base.  Its catchy corporate slogans can be recited by nearly everyone."]
civics_array.each do |civic|
  Civic.create!(
    name: civic.second,
    icon: wiki_url + civic.first,
    effects: civic.third,
    description: civic.fourth.split("\n").first,
    type: 'corporate'
  )
end

p 'creating Hive Mind civics'

civics_array = StellarisWikiScraper.new.civics_scraper(3, 4)
# => ["/images/thumb/4/42/Civic_ascetic.png/50px-Civic_ascetic.png", "Ascetic", "−15% Pop Amenities Usage", "The Hive Mind cares little for material comforts."]
civics_array.each do |civic|
  Civic.create!(
    name: civic.second,
    icon: wiki_url + civic.first,
    effects: civic.third,
    description: civic.fourth.split("\n").first,
    type: 'hive'
  )
end

p 'creating Machine Intelligence civics'

civics_array = StellarisWikiScraper.new.civics_scraper(4, 4)
# => ["/images/thumb/d/d3/Civic_machine_builder.png/50px-Civic_machine_builder.png", "Constructobot", "−10% Building and District cost\n −10% Building and District upkeep", "Responsible for organizing all planetary construction since its inception, the Machine Intelligence executes efficiently on all manner of facility construction projects."]
civics_array.each do |civic|
  Civic.create!(
    name: civic.second,
    icon: wiki_url + civic.first,
    effects: civic.third,
    description: civic.fourth.split("\n").first,
    type: 'machine'
  )
end

p 'creating standard and biological traits'
traits = StellarisWikiScraper.new.traits_scraper(0, 7)
# => ["/images/1/10/Adaptive.png, Adaptive", "Habitability +10%", "Extremely Adaptive\n Nonadaptive\n Robust", "x", "2", "+50", "This species is highly adaptive when it comes to foreign environments."]
traits.each do |trait|
  Trait.create!(
    name: trait.first.split(', ').second,
    icon: wiki_url + trait.first.split(', ').first,
    effects: trait.second,
    value: trait.fifth.to_i,
    description: trait.seventh,
    type: trait.fourth.empty? ? 'standard' : 'biological',
    category: (trait.third.split("\n ") << trait.first).sort.join(' - ')
  )
end

p 'creating hive minded trait'
Trait.create!(
  name: 'Hive-Minded',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/7/7d/Hive-minded.png/29px-Hive-minded.png',
  effects: 'Not Affected by Happiness',
  value: 0,
  description: 'This species is made up of semi-autonomous individuals slaved to a single, unfathomably vast consciousness.',
  type: 'biological'
)

p 'creating lithoid traits'
traits = StellarisWikiScraper.new.traits_scraper(1, 6)
# => ["/images/9/9f/Trait_lithoid.png, Lithoid", "Pop growth Speed -25%\n Habitability +50%\n Army Health +50%\n Leader Lifespan +50\nConsumes  Minerals instead of  Food", "", "0", "0", "This species has a silicon based biology, and consumes minerals rather than food. They are tougher than traditional organics and have slower metabolisms, making them long lived but slow to reproduce."]
traits.each do |trait|
  Trait.create!(
    name: trait.first.split(', ').second,
    icon: wiki_url + trait.first.split(', ').first,
    effects: trait.second,
    value: trait.fourth.to_i,
    description: trait[5],
    type: 'lithoid',
    category: (trait.third.split("\n ") << trait.first).sort.join(' - ')
  )
end

p 'creating robotic traits'
traits = StellarisWikiScraper.new.traits_scraper(-1, 8)
# => ["/images/c/c2/Domestic_protocols.png, Domestic Protocols", "2", "", "x", "Can be employed in Servant Jobs if under AI Servitude\n Amenities from Jobs +20%", "", "Droids", "Specialized equipment and behavior protocols for all conceivable domestic needs. Full functionality guaranteed."]
traits.each do |trait|
  if trait.fourth.empty?
    Trait.create!(
      name: trait.first.split(', ').second,
      icon: wiki_url + trait.first.split(', ').first,
      effects: trait[4],
      value: trait.second.to_i,
      description: trait[7],
      type: 'robotic',
      category: (trait[5].split("\n ") << trait.first).sort.join(' - ')
    )
  end
end

p 'creating governments'
governments_array = StellarisWikiScraper.new.governments_scraper
# => ["/images/a/a8/Auth_democratic.png, Democratic", "Democratic", "10 years", "", "Rulers have mandates\n Re-election", "Authoritarian\n Fanatic Authoritarian\n Gestalt Consciousness", "Democratic governments have regular elections where all citizens can vote on who should represent them."]
governments_array.each do |government|
  Government.create!(
    type: government.first.split(', ').second,
    icon: government.first.split(', ').first,
    description: government.last
  )
end

p 'done'
