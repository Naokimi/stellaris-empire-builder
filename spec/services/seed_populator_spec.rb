require 'rails_helper'
require_relative '../shared/scraped_arrays'

RSpec.describe SeedPopulator do
  include_context 'scraped arrays'

  context 'Civics' do
    context 'standard' do
      it 'reads correctly the name' do
        expect(standard_civic[:name]).to eq('Agrarian Idyll')
      end
      it 'reads correctly the icon' do
        expect(standard_civic[:icon]).to eq('https://stellaris.paradoxwikis.com/images/thumb/1/1f/Civic_agrarian_idyll.png/50px-Civic_agrarian_idyll.png')
      end
      it 'reads correctly the effects' do
        expect(standard_civic[:effects]).to eq("+1 housing from Generator, Mining and Agriculture districts\n −1 housing from City Districts\n Farmers also produce  +2 amenities\n Cannnot pick  Arcology Project ascension perk")
      end
      it 'reads correctly the description' do
        expect(standard_civic[:description]).to eq('A simple and peaceful life can often be the most rewarding. This agrarian society has, to a large extent, managed to avoid large-scale urbanization.')
      end
    end

    context 'corporate' do
      it 'reads correctly the name' do
        expect(corporate_civic[:name]).to eq('Brand Loyalty')
      end
      it 'reads correctly the icon' do
        expect(corporate_civic[:icon]).to eq('https://stellaris.paradoxwikis.com/images/5/5d/Civic_brand_loyalty.png')
      end
      it 'reads correctly the effects' do
        expect(corporate_civic[:effects]).to eq("+15% Monthly Unity")
      end
      it 'reads correctly the description' do
        expect(corporate_civic[:description]).to eq('This Megacorporation has fostered a great sense of brand loyalty among its internal consumer base.  Its catchy corporate slogans can be recited by nearly everyone.')
      end
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
