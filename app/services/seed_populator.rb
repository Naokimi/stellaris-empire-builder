class SeedPopulator
  def initialize(scraped_array)
    @scraped_array = scraped_array
    @wiki_url = 'https://stellaris.paradoxwikis.com'
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
      icon: @wiki_url + ethic.first.split(', ').first,
      value: ethic_value,
      effects: ethic.second,
      description: ethic.last,
      category: ethic.first.split(', ').third
    }
  end
end
