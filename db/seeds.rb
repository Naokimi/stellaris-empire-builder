# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
wiki_url = 'https://stellaris.paradoxwikis.com'

p 'creating ethics'

ethics_array = ScraperService.new.ethics_scraper(0, 4)
# => ["/images/thumb/1/10/Fanatic_Authoritarian.png/42px-Fanatic_Authoritarian.png, Fanatic Authoritarian", "+1 Monthly Influence\n +10% Worker Output", "Must have  Autocratic authority\nAllows Stratified Economy Living Standards\nCan Enslave aliens", "A single voice, a single throne, a single state. It is the solemn duty of the masses to obey those enlightened few who have been charged with the great responsibility of leadership."]
ethics_array.each do |ethic|
  Civic.create!(
    name: ethic.first.split(', ').second,
    icon: wiki_url + ethic.first.split(', ').first,
    value: ethic.first.split(', ').second.include?('Fanatic') ? 2 : 1,
    effects: civic.second,
    description: civic.third,
    category: 'hierarchy'
  )
end


Ethic.create!(
  name: 'Fanatic Authoritarian',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/1/10/Fanatic_Authoritarian.png/42px-Fanatic_Authoritarian.png',
  value: 2,
  effects: '+1 Monthly Influence, +10% Worker Output',
  category: 'hierarchy',
  description: 'A single voice, a single throne, a single state. It is the solemn duty of the masses to obey those enlightened few who have been charged with the great responsibility of leadership.'
)
Ethic.create!(
  name: 'Authoritarian',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/b/bf/Authoritarian.png/42px-Authoritarian.png',
  value: 1,
  effects: '+0.5 Monthly Influence, +5% Worker Output',
  category: 'hierarchy',
  description: 'A strong, guiding hand is essential to the success of any civilization - the alternative would be anarchy and chaos. It is the duty of the state to steer its citizens towards the paths that are the most productive.'
)
Ethic.create!(
  name: 'Egalitarian',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/6/6a/Egalitarian.png/42px-Egalitarian.png',
  value: 1,
  effects: '+25% Faction Influence Gain, +5% Specialist Output',
  category: 'hierarchy',
  description: 'Any society that does not embrace equality between its members - where an individual can rise to any position with enough hard work - is not only deeply unfair, but ultimately counterproductive.'
)
Ethic.create!(
  name: 'Fanatic Egalitarian',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/1/1b/Fanatic_Egalitarian.png/42px-Fanatic_Egalitarian.png',
  value: 2,
  effects: '+50% Faction Influence Gain, +10% Specialist Output',
  category: 'hierarchy',
  description: 'Beware always those who would be despots, under the false presumption that their desires and agendas are somehow more imperative than those of their fellows. A society that does not see to the needs and rights of all of its members is not a society - it is a crime.'
)
Ethic.create!(
  name: 'Fanatic Authoritarian',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/1/10/Fanatic_Authoritarian.png/42px-Fanatic_Authoritarian.png',
  value: 2,
  effects: '+1 Monthly Influence, +10% Worker Output',
  category: 'hierarchy',
  description: 'A single voice, a single throne, a single state. It is the solemn duty of the masses to obey those enlightened few who have been charged with the great responsibility of leadership.'
)
Ethic.create!(
  name: 'Fanatic Xenophobe',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/8/81/Fanatic_Xenophobe.png/42px-Fanatic_Xenophobe.png',
  value: 2,
  effects: '-40% Starbase Influence Cost, +20% Pop Growth Speed',
  category: 'immigration',
  description: 'Any alien influence must be ruthlessly quashed. Only by staying pure, and true to ourselves and the planet that gave us life can we guard against insidious Xeno plots. Even mastery over the Alien might not be enough to guarantee our own safety...'
)
Ethic.create!(
  name: 'Xenophobe',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/1/10/Fanatic_Authoritarian.png/42px-Fanatic_Authoritarian.png',
  value: 1,
  effects: '-20% Starbase Influence Cost, +10% Pop Growth Speed',
  category: 'immigration',
  description: 'The stakes could not be higher as we reach into the vast uncharted expanses of the galaxy, for we are gambling with the very survival of our species! Never trust the alien; its false smile hides an unknowable mind...'
)
Ethic.create!(
  name: 'Xenophile',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/b/b0/Xenophile.png/42px-Xenophile.png',
  value: 1,
  effects: '+10% Trade Value, −25% Diplomatic Influence Upkeep',
  category: 'immigration',
  description: 'There exists, in all of us, a deep-seated fascination for the unknown. An adventurous spirit that rejects the familiar and glories in the unfamiliar, whatever - or whomever - it may be.'
)
Ethic.create!(
  name: 'Fanatic Xenophile',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/6/68/Fanatic_Xenophile.png/42px-Fanatic_Xenophile.png',
  value: 2,
  effects: '+20% Trade Value, −50% Diplomatic Influence Upkeep',
  category: 'immigration',
  description: 'If there ever was such a thing as an absolute moral imperative, it would be to explore the cosmos and embrace all within it. We were never meant to journey alone.'
)
Ethic.create!(
  name: 'Fanatic Militarist',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/5/55/Fanatic_Militarist.png/42px-Fanatic_Militarist.png',
  value: 2,
  effects: '-20% Claim Influence Cost, +20% Ship Fire Rate',
  category: 'war',
  description: 'The ability to project force is of paramount importance. The only way to preserve our way of life is to make sure everyone shares it; willingly or not...'
)
Ethic.create!(
  name: 'Militarist',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/4/44/Militarist.png/42px-Militarist.png',
  value: 1,
  effects: '-10% Claim Influence Cost, +10% Ship Fire Rate',
  category: 'war',
  description: 'The only true virtues are courage and discipline, and channeled properly they can overcome any obstacle. Therein lies true strength; force withheld, a promise made.'
)
Ethic.create!(
  name: 'Pacifist',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/4/4a/Pacifist.png/42px-Pacifist.png',
  value: 1,
  effects: '+10 Administrative Cap, +5 Stability',
  category: 'war',
  description: 'Conflict as a means to an end is a ridiculous concept. It is by nature destructive, destroying what was to be obtained or giving room to grow that which was to be destroyed.'
)
Ethic.create!(
  name: 'Fanatic Pacifist',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/a/ab/Fanatic_Pacifist.png/42px-Fanatic_Pacifist.png',
  value: 2,
  effects: '+20 Administrative Cap, +10 Stability',
  category: 'war',
  description: 'As civilized beings, the end of all armed conflict should be our primary concern. War is an evolutionary dead end, as futile as it is wasteful.'
)
Ethic.create!(
  name: 'Fanatic Materialist',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/3/3e/Fanatic_Materialist.png/42px-Fanatic_Materialist.png',
  value: 2,
  effects: '−20% Robot Upkeep, +10% Research Speed',
  category: 'faith',
  description: 'Although it hurts, we must grow up and put aside our outdated notions of morality. There is no "divine spark" granting special value to a living mind. No object has any intrinsic value apart from what we choose to grant it. Let us embrace the freedom of certitude, and achieve maximum efficiency in all things!'
)
Ethic.create!(
  name: 'Materialist',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/e/ef/Materialist.png/42px-Materialist.png',
  value: 1,
  effects: '−10% Robot Upkeep, +5% Research Speed',
  category: 'faith',
  description: 'As we reach for the stars, we must put away childish things; gods, spirits and other phantasms of the brain. Reality is cruel and unforgiving, yet we must steel ourselves and secure the survival of our race through the unflinching pursuit of science and technology.'
)
Ethic.create!(
  name: 'Spiritualist',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/b/be/Spiritualist.png/42px-Spiritualist.png',
  value: 1,
  effects: '+10% Monthly Unity, -5% Edict Cost',
  category: 'faith',
  description: 'There are those think it behooves us to remember how tiny we are, how pointless our lives in this vast uncaring universe... What nonsense! The only truth we can ever know is that of our own existence. The universe - in all its apparent glory - is but a dream we all happen to share.'
)
Ethic.create!(
  name: 'Fanatic Spiritualist',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/1/11/Fanatic_Spiritualist.png/42px-Fanatic_Spiritualist.png',
  value: 2,
  effects: '+20% Monthly Unity, -10% Edict Cost',
  category: 'faith',
  description: 'Our science has proved that Consciousness begets reality. We regard with patience the childlike efforts of those who delude themselves it is the other way around, as they play with their blocks of "hard matter".'
)
Ethic.create!(
  name: 'Gestalt Consciousness',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/d/d3/Gestalt_consciousness.png/42px-Gestalt_consciousness.png',
  value: 3,
  effects: '-20% War Exhaustion Gain, +1 Monthly Influence',
  category: 'gestalt',
  description: "We reach into the void.\nThe vast expanse becomes us."
)

p 'creating Standard civics'

civics_array = ScraperService.new.default_scraper(0, 6)
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

civics_array = ScraperService.new.default_scraper(2, 4)
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

civics_array = ScraperService.new.default_scraper(3, 4)
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

civics_array = ScraperService.new.default_scraper(4, 4)
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
traits = ScraperService.new.traits_scraper(0, 7)
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
traits = ScraperService.new.traits_scraper(1, 6)
# => ["/images/9/9f/Trait_lithoid.png, Lithoid", "Pop growth Speed -25%\n Habitability +50%\n Army Health +50%\n Leader Lifespan +50\nConsumes  Minerals instead of  Food", "", "0", "0", "This species has a silicon based biology, and consumes minerals rather than food. They are tougher than traditional organics and have slower metabolisms, making them long lived but slow to reproduce."]
traits.each do |trait|
  Trait.create!(
    name: trait.first.split(', ').second,
    icon: wiki_url + trait.first.split(', ').first,
    effects: trait.second,
    value: trait.fourth.to_i,
    description: trait.sixth,
    type: 'lithoid',
    category: (trait.third.split("\n ") << trait.first).sort.join(' - ')
  )
end

p 'creating robotic traits'
traits = ScraperService.new.traits_scraper(-1, 7)
# => ["/images/c/c2/Domestic_protocols.png, Domestic Protocols", "2", "", "x", "Can be employed in Servant Jobs if under AI Servitude\n Amenities from Jobs +20%", "Robot", "Specialized equipment and behavior protocols for all conceivable domestic needs. Full functionality guaranteed.(Has no effect on Synthetics with Citizenship Rights.)"]
traits.each do |trait|
  if trait.fourth.empty?
    Trait.create!(
      name: trait.first.split(', ').second,
      icon: wiki_url + trait.first.split(', ').first,
      effects: trait.fifth,
      value: trait.second.to_i,
      description: trait.seventh,
      type: 'robotic',
      category: (trait.sixth.split("\n ") << trait.first).sort.join(' - ')
    )
  end
end

p 'done'
