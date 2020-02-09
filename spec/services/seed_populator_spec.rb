require 'rails_helper'
require_relative '../shared/scraped_arrays'

RSpec.describe SeedPopulator do
  include_context 'scraped arrays'

  context 'Civics' do
    it 'reads correctly the name' do
      expect(standard_civic[:name]).to eq('Fanatic Authoritarian')
    end
    it 'reads correctly the icon' do
      expect(standard_civic[:icon]).to eq('https://stellaris.paradoxwikis.com/images/thumb/1/10/Fanatic_Authoritarian.png/42px-Fanatic_Authoritarian.png')
    end
    it 'reads correctly the effects' do
      expect(standard_civic[:effects]).to eq("+1 Monthly Influence\n +10% Worker Output")
    end
    it 'reads correctly the description' do
      expect(standard_civic[:description]).to eq('A single voice, a single throne, a single state. It is the solemn duty of the masses to obey those enlightened few who have been charged with the great responsibility of leadership.')
    end
  end

  context 'Ethics' do
    it 'reads correctly the name' do
      expect(ethic[:name]).to eq('Fanatic Authoritarian')
    end
    it 'reads correctly the icon' do
      expect(ethic[:icon]).to eq('https://stellaris.paradoxwikis.com/images/thumb/1/10/Fanatic_Authoritarian.png/42px-Fanatic_Authoritarian.png')
    end
    it 'reads correctly the value' do
      expect(ethic[:value]).to eq(2)
    end
    it 'reads correctly the effects' do
      expect(ethic[:effects]).to eq("+1 Monthly Influence\n +10% Worker Output")
    end
    it 'reads correctly the description' do
      expect(ethic[:description]).to eq('A single voice, a single throne, a single state. It is the solemn duty of the masses to obey those enlightened few who have been charged with the great responsibility of leadership.')
    end
    it 'reads correctly the category' do
      expect(ethic[:category]).to eq('Authoritarian - Egalitarian')
    end
  end
end
