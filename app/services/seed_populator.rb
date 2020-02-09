class SeedPopulator
  WIKI_URL = 'https://stellaris.paradoxwikis.com'.freeze

  def initialize(scraped_array, type = nil)
    @scraped_array = scraped_array
    @type = type
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
    description = @type == 'standard' ? civic.fifth : civic.fourth.split("\n").first
    Civic.create!(
      name: civic.second,
      icon: WIKI_URL + civic.first,
      effects: civic.third,
      description: description,
      type: @type
    )
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
end
