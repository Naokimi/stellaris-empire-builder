require 'rails_helper'
require_relative '../shared/scraped_arrays'

RSpec.describe StellarisWikiScraper do
  include_context 'scraped arrays'

  context 'Civics' do
    it 'scrapes standard' do
      result = ["/images/thumb/1/1f/Civic_agrarian_idyll.png/50px-Civic_agrarian_idyll.png", "Agrarian Idyll", "+1 housing from Generator, Mining and Agriculture districts\n −1 housing from City Districts\n Farmers also produce  +2 amenities\n Cannnot pick  Arcology Project ascension perk", "Pacifist\n Syncretic Evolution\n Slaver Guilds\n Post-Apocalyptic", "A simple and peaceful life can often be the most rewarding. This agrarian society has, to a large extent, managed to avoid large-scale urbanization.", ""]
      expect(standard_civics_array.first).to eq(result)
    end
    it 'scrapes corporate' do
      result = ["/images/5/5d/Civic_brand_loyalty.png", "Brand Loyalty", "+15% Monthly Unity", "This Megacorporation has fostered a great sense of brand loyalty among its internal consumer base.  Its catchy corporate slogans can be recited by nearly everyone."]
      expect(corporate_civics_array.first).to eq(result)
    end
    it 'scrapes hive mind' do
      result = ["/images/thumb/4/42/Civic_ascetic.png/50px-Civic_ascetic.png", "Ascetic", "−15% Pop Amenities Usage", "The Hive Mind cares little for material comforts."]
      expect(hive_civics_array.first).to eq(result)
    end
    it 'scrapes machine intelligence' do
      result = ["/images/thumb/d/d3/Civic_machine_builder.png/50px-Civic_machine_builder.png", "Constructobot", "−10% Building and District cost\n −10% Building and District upkeep", "Responsible for organizing all planetary construction since its inception, the Machine Intelligence executes efficiently on all manner of facility construction projects."]
      expect(machine_civics_array.first).to eq(result)
    end
  end

  context 'Ethics' do
    it 'scrapes Fanatic Authoritarians' do
      result = ["/images/thumb/1/10/Fanatic_Authoritarian.png/42px-Fanatic_Authoritarian.png, Fanatic Authoritarian, Authoritarian - Egalitarian", "+1 Monthly Influence\n +10% Worker Output", "Must have  Autocratic authority\nAllows Stratified Economy Living Standards\nCan Enslave aliens", "A single voice, a single throne, a single state. It is the solemn duty of the masses to obey those enlightened few who have been charged with the great responsibility of leadership."]
      expect(ethics_array.first).to eq(result)
    end
    it 'scrapes Gestalt Consciousness' do
      result = ["/images/thumb/d/d3/Gestalt_consciousness.png/42px-Gestalt_consciousness.png, Gestalt Consciousness, Gestalt Consciousness", "-20% War Exhaustion Gain\n +1 Monthly Influence", "Cannot use any  default authority\nCan use the Full Orbital Bombardment policy\nRulers are Immortal\nNative Pops are not affected by happiness and will not join Factions\nNative Pops cannot survive in empires with a different authority\nNon-native Pops cannot survive in Gestalt Consciousness empires\nCan use the  No Retreat War Doctrine", "We reach into the void.The vast expanse becomes us."]
      expect(ethics_array.last).to eq(result)
    end
  end

  context 'Governments' do
    it 'scrapes Democracy' do
      result = ["/images/a/a8/Auth_democratic.png, Democratic", "Democratic", "10 years", "", "Rulers have mandates\n Re-election", "Authoritarian\n Fanatic Authoritarian\n Gestalt Consciousness", "Democratic governments have regular elections where all citizens can vote on who should represent them."]
      expect(governments_array.first).to eq(result)
    end
  end

  context 'Traits' do
    it 'scrapes standard and biological' do
      result = ["/images/1/10/Adaptive.png, Adaptive", "Habitability +10%", "Extremely Adaptive\nNonadaptive\nRobust", "x", "2", "+50", "This species is highly adaptive when it comes to foreign environments."]
      expect(standard_traits_array.first).to eq(result)
    end
    it 'scrapes lithoid' do
      result = ["/images/9/9f/Trait_lithoid.png, Lithoid", "Pop growth Speed -25%\n Habitability +50%\n Army Health +50%\n Leader Lifespan +50\nConsumes  Minerals instead of  Food", "", "0", "0", "This species has a silicon based biology, and consumes minerals rather than food. They are tougher than traditional organics and have slower metabolisms, making them long lived but slow to reproduce."]
      expect(lithoid_traits_array.first).to eq(result)
    end
    it 'scrapes robotic' do
      result = ["/images/c/c2/Domestic_protocols.png, Domestic Protocols", "2", "", "x", "Can be employed in Servant Jobs if under AI Servitude\n Amenities from Jobs +20%", "", "Droids", "Specialized equipment and behavior protocols for all conceivable domestic needs. Full functionality guaranteed."]
      expect(robotic_traits_array.first).to eq(result)
    end
  end
end
