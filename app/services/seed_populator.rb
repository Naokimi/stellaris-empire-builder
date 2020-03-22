class SeedPopulator
  WIKI_URL = 'https://stellaris.paradoxwikis.com'.freeze

  def initialize(scraped_array, group = nil)
    @scraped_array = scraped_array
    @group = group
  end

  def civics_creator
    @scraped_array.each do |civic|
      Civic.create!(civic_reader(civic))
    end
  end

  def civic_reader(civic)
    # => ["/images/thumb/1/1f/Civic_agrarian_idyll.png/50px-Civic_agrarian_idyll.png", "Agrarian Idyll", "+1 housing from Generator, Mining and Agriculture districts\n −1 housing from City Districts\n Farmers also produce  +2 amenities\n Cannnot pick  Arcology Project ascension perk", "Pacifist\n Syncretic Evolution\n Slaver Guilds\n Post-Apocalyptic", "A simple and peaceful life can often be the most rewarding. This agrarian society has, to a large extent, managed to avoid large-scale urbanization.", ""]
    # => ["/images/5/5d/Civic_brand_loyalty.png", "Brand Loyalty", "+15% Monthly Unity", "This Megacorporation has fostered a great sense of brand loyalty among its internal consumer base.  Its catchy corporate slogans can be recited by nearly everyone."]
    # => ["/images/thumb/4/42/Civic_ascetic.png/50px-Civic_ascetic.png", "Ascetic", "−15% Pop Amenities Usage", "The Hive Mind cares little for material comforts."]
    # => ["/images/thumb/d/d3/Civic_machine_builder.png/50px-Civic_machine_builder.png", "Constructobot", "−10% Building and District cost\n −10% Building and District upkeep", "Responsible for organizing all planetary construction since its inception, the Machine Intelligence executes efficiently on all manner of facility construction projects."]
    description = @group == 'standard' ? civic.fifth : civic.fourth.split("\n").first
    {
      name: civic.second,
      icon: WIKI_URL + civic.first,
      effects: civic.third,
      description: description,
      group: @group
    }
  end

  def ethics_creator
    @scraped_array.each do |ethic|
      Ethic.create!(ethic_reader(ethic))
    end
  end

  def ethic_reader(ethic)
    # => ["/images/thumb/1/10/Fanatic_Authoritarian.png/42px-Fanatic_Authoritarian.png, Fanatic Authoritarian, Authoritarian - Egalitarian", "+1 Monthly Influence\n +10% Worker Output", "Must have  Autocratic authority\nAllows Stratified Economy Living Standards\nCan Enslave aliens", "A single voice, a single throne, a single state. It is the solemn duty of the masses to obey those enlightened few who have been charged with the great responsibility of leadership."]
    ethic_name = ethic.first.split(', ').second
    ethic_value = if ethic_name.include?('Gestalt')
                    3
                  elsif ethic_name.include?('Fanatic')
                    2
                  else
                    1
                  end
    {
      name: ethic_name,
      icon: WIKI_URL + ethic.first.split(', ').first,
      value: ethic_value,
      effects: ethic.second,
      description: ethic.last,
      category: ethic.first.split(', ').third
    }
  end

  def governments_creator
    @scraped_array.each do |government|
      Government.create!(government_reader(government))
    end
  end

  def government_reader(government)
    # => ["/images/a/a8/Auth_democratic.png, Democratic", "Democratic", "10 years", "", "Rulers have mandates\n Re-election", "Authoritarian\n Fanatic Authoritarian\n Gestalt Consciousness", "Democratic governments have regular elections where all citizens can vote on who should represent them."]
    {
      authority: government.first.split(', ').second,
      icon: WIKI_URL + government.first.split(', ').first,
      description: government.last
    }
  end

  def origins_creator
    @scraped_array.each do |origin|
      Origin.create!(origin_reader(origin))
    end
  end

  def origin_reader(origin)
    # => ["/images/e/e6/Origins_gateway.png, Galactic Doorstep", "None", "Start with a dormant Gateway in which will brings the following in the first years:\n100-1500  Alloys and/or  Minerals\nA small space amoeba\nA special project that creates the From Gateway Sent Archaeological Site\n If the Gateway is reactivated it unlocks the Gateway Construction technology", "", ""]
    homeworld_effects = origin.second == 'None' ? '' : origin.second
    empire_effects = origin.third == 'None' ? '' : origin.third
    {
      name: origin.first.split(', ').second,
      image: WIKI_URL + origin.first.split(', ').first,
      effects: (homeworld_effects + ' ' + empire_effects).strip
    }
  end

  def traits_creator
    @scraped_array.each do |trait|
      if @group == 'lithoid'
        Trait.create!(lithoid_trait_reader(trait))
      elsif @group == 'robotic'
        next if trait.fourth.present?

        Trait.create!(robotic_trait_reader(trait))
      else
        Trait.create!(standard_trait_reader(trait))
      end
    end
  end

  def standard_trait_reader(trait)
    # => ["/images/1/10/Adaptive.png, Adaptive", "Habitability +10%", "Extremely Adaptive\nNonadaptive\nRobust", "x", "2", "+50", "This species is highly adaptive when it comes to foreign environments."]
    name = trait.first.split(', ').second
    category = (trait.third.split("\n ") << name).sort.join(' - ')
    {
      name: name,
      icon: WIKI_URL + trait.first.split(', ').first,
      effects: trait.second,
      value: trait.fifth.to_i,
      description: trait[6],
      group: trait.fourth.empty? ? 'standard' : 'biological',
      category: trait.third.present? ? category : nil
    }
  end

  def lithoid_trait_reader(trait)
    # => ["/images/9/9f/Trait_lithoid.png, Lithoid", "Pop growth Speed -25%\n Habitability +50%\n Army Health +50%\n Leader Lifespan +50\nConsumes  Minerals instead of  Food", "", "0", "0", "This species has a silicon based biology, and consumes minerals rather than food. They are tougher than traditional organics and have slower metabolisms, making them long lived but slow to reproduce."]
    name = trait.first.split(', ').second
    category = (trait.third.split("\n ") << name).sort.join(' - ')
    {
      name: name,
      icon: WIKI_URL + trait.first.split(', ').first,
      effects: trait.second,
      value: trait.fourth.to_i,
      description: trait[5],
      group: @group,
      category: trait.third.present? ? category : nil
    }
  end

  def robotic_trait_reader(trait)
    # => ["/images/c/c2/Domestic_protocols.png, Domestic Protocols", "2", "", "x", "Can be employed in Servant Jobs if under AI Servitude\n Amenities from Jobs +20%", "", "Droids", "Specialized equipment and behavior protocols for all conceivable domestic needs. Full functionality guaranteed."]
    name = trait.first.split(', ').second
    category = (trait[5].split("\n ") << name).sort.join(' - ')
    {
      name: name,
      icon: WIKI_URL + trait.first.split(', ').first,
      effects: trait[4],
      value: trait.second.to_i,
      description: trait[7],
      group: @group,
      category: trait[5].present? ? category : nil
    }
  end
end
