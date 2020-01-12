class ScrapersController < ApplicationController
  def civics_scraper(tables_index, slice_size)
    tables = tables_scraper('https://stellaris.paradoxwikis.com/Civics')
    scraped_array = []
    tables[tables_index].search('td').map do |element|
      icon_src = element.children.children.attribute('src')
      icon_src && element.text.strip.empty? ? icon_src.value : element.text.strip
    end.each_slice(slice_size) { |slice| scraped_array << slice }
    scraped_array
  end

  def traits_scraper(tables_index, slice_size)
    tables = tables_scraper('https://stellaris.paradoxwikis.com/Traits')
    scraped_array = []
    tables[tables_index].search('td').each_with_index.map do |element, i|
      lithoid_restriction = element.children.attribute('alt')
      icon_src = element.children.children.attribute('src')
      if lithoid_restriction
        'x'
      elsif (i % slice_size).zero?
        icon_src.value + ', ' + element.text.strip
      elsif icon_src && element.text.strip.empty?
        icon_src.value
      else
        element.text.strip
      end
    end.each_slice(slice_size) { |slice| scraped_array << slice }
    scraped_array
  end

  private

  def tables_scraper(url)
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('.mildtable tbody')
  end
end
