require 'open-uri'

class ScraperService
  def ethics_scraper
    # tables = tables_scraper('https://stellaris.paradoxwikis.com/Ethics')
    # scraped_array = []
    # tables[tables_index].search('td').each_with_index.map do |element, i|
    #   icon_src = element.children.children.children.attribute('src')
    #   if (i % slice_size).zero?
    #     icon_src.value + ', ' + element.text.strip
    #   elsif icon_src && element.text.strip.empty?
    #     icon_src.value
    #   else
    #     element.text.strip
    #   end
    # end.each_slice(slice_size) { |slice| scraped_array << slice }
    # scraped_array
    url = 'https://stellaris.paradoxwikis.com/Ethics'
    document = html_doc(url)
    tables = tables_scraper(document)
    scraped_array = []
    # iterate through all the tables, map with index and create a array of ethics arrays
    # don't forget to add to the array the h3 name [0..-7] to use for category
    scraped_array
  end

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

  def tables_scraper(url, document = html_doc(url))
    document.search('.mildtable tbody')
  end

  def default_scraper(url, target, document = html_doc(url))
    document.search(target)
  end

  def html_doc(url)
    html_file = open(url).read
    Nokogiri::HTML(html_file)
  end
end
