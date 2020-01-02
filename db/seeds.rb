# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'creating ethics'

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

p 'creating civics'
Civic.create!(
  name: 'Agrarian Idyll',
  icon: 'https://stellaris.paradoxwikis.com/images/thumb/1/1f/Civic_agrarian_idyll.png/50px-Civic_agrarian_idyll.png',
  effects: '+1 housing from Generator, Mining and Agriculture districts, −1 housing from City Districts, Farmers also produce +2 amenities, Cannnot pick Arcology Project ascension perk',
  description: 'A simple and peaceful life can often be the most rewarding. This agrarian society has, to a large extent, managed to avoid large-scale urbanization.'
)
