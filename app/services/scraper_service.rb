require 'open-uri'

class ScraperService
  def civics_scraper(tables_index, slice_size)
    tables = tables_scraper('https://stellaris.paradoxwikis.com/Civics')
    mapped_tables = tables[tables_index].search('td').map do |element|
      icon_src = element.children.children.attribute('src')
      icon_src && element.text.strip.empty? ? icon_src.value : element.text.strip
    end
    slicer(mapped_tables, slice_size)
  end

  def ethics_scraper
    document = html_doc('https://stellaris.paradoxwikis.com/Ethics')
    last_gestalt_index = 67
    sanitized_range = 0..-7

    mapped_headlines = default_scraper(document, 'h3').map do |element|
      element.text.strip[sanitized_range]
    end
    mapped_tables = tables_scraper(document).search('td').each_with_index.map do |element, i|
      icon_src = element.children.children.children.attribute('src')
      if i > last_gestalt_index
        nil
      elsif (i % 4).zero?
        icon_src.value + ', ' + element.text.strip + ', ' + mapped_headlines[i / 16]
      else
        element.text.strip
      end
    end
    slicer(mapped_tables.compact, 4)
  end

  def traits_scraper(tables_index, slice_size)
    tables = tables_scraper('https://stellaris.paradoxwikis.com/Traits')
    mapped_tables = tables[tables_index].search('td').each_with_index.map do |element, i|
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
    end
    slicer(mapped_tables, slice_size)
  end

  private

  def default_scraper(url_or_doc, target)
    document = url_or_doc.class == String ? html_doc(url_or_doc) : url_or_doc
    document.search(target)
  end

  def html_doc(url)
    html_file = open(url).read
    Nokogiri::HTML(html_file)
  end

  def slicer(array, slice_size)
    sliced_array = []
    array.each_slice(slice_size) { |slice| sliced_array << slice }
    sliced_array
  end

  def tables_scraper(url_or_doc)
    default_scraper(url_or_doc, '.mildtable tbody')
  end
end
