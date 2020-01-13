require 'rails_helper'

RSpec.describe ScraperService do
  context 'Civics' do
    it 'scrapes standard' do
      result = ["/images/thumb/1/1f/Civic_agrarian_idyll.png/50px-Civic_agrarian_idyll.png", "Agrarian Idyll", "+1 housing from Generator, Mining and Agriculture districts\n −1 housing from City Districts\n Farmers also produce  +2 amenities\n Cannnot pick  Arcology Project ascension perk", "Pacifist\n Syncretic Evolution\n Slaver Guilds\n Post-Apocalyptic", "A simple and peaceful life can often be the most rewarding. This agrarian society has, to a large extent, managed to avoid large-scale urbanization.", ""]
      scraped_array = ScraperService.new.civics_scraper(0, 6)
      expect(scraped_array.first).to eq(result)
    end
    it 'scrapes corporate' do
      result = ["/images/5/5d/Civic_brand_loyalty.png", "Brand Loyalty", "+15% Monthly Unity", "This Megacorporation has fostered a great sense of brand loyalty among its internal consumer base.  Its catchy corporate slogans can be recited by nearly everyone."]
      scraped_array = ScraperService.new.civics_scraper(2, 4)
      expect(scraped_array.first).to eq(result)
    end
    it 'scrapes hive mind' do
      result = ["/images/thumb/4/42/Civic_ascetic.png/50px-Civic_ascetic.png", "Ascetic", "−15% Pop Amenities Usage", "The Hive Mind cares little for material comforts."]
      scraped_array = ScraperService.new.civics_scraper(3, 4)
      expect(scraped_array.first).to eq(result)
    end
    it 'scrapes machine intelligence' do
      result = ["/images/thumb/d/d3/Civic_machine_builder.png/50px-Civic_machine_builder.png", "Constructobot", "−10% Building and District cost\n −10% Building and District upkeep", "Responsible for organizing all planetary construction since its inception, the Machine Intelligence executes efficiently on all manner of facility construction projects."]
      scraped_array = ScraperService.new.civics_scraper(4, 4)
      expect(scraped_array.first).to eq(result)
    end
  end

  context 'Traits' do
    it 'scrapes standard and biological' do
      result = ["/images/1/10/Adaptive.png, Adaptive", "Habitability +10%", "Extremely Adaptive\n Nonadaptive\n Robust", "x", "2", "+50", "This species is highly adaptive when it comes to foreign environments."]
      scraped_array = ScraperService.new.traits_scraper(0, 7)
      expect(scraped_array.first).to eq(result)
    end
    it 'scrapes lithoid' do
      result = ["/images/9/9f/Trait_lithoid.png, Lithoid", "Pop growth Speed -25%\n Habitability +50%\n Army Health +50%\n Leader Lifespan +50\nConsumes  Minerals instead of  Food", "", "0", "0", "This species has a silicon based biology, and consumes minerals rather than food. They are tougher than traditional organics and have slower metabolisms, making them long lived but slow to reproduce."]
      scraped_array = ScraperService.new.traits_scraper(1, 6)
      expect(scraped_array.first).to eq(result)
    end
    it 'scrapes robotic' do
      result = ["/images/c/c2/Domestic_protocols.png, Domestic Protocols", "2", "", "x", "Can be employed in Servant Jobs if under AI Servitude\n Amenities from Jobs +20%", "Robot", "Specialized equipment and behavior protocols for all conceivable domestic needs. Full functionality guaranteed.(Has no effect on Synthetics with Citizenship Rights.)"]
      scraped_array = ScraperService.new.traits_scraper(-1, 7)
      expect(scraped_array.first).to eq(result)
    end
  end
end
