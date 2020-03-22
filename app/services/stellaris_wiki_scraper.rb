require 'open-uri'

class StellarisWikiScraper
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
    sanitized_range = 0..-7
    slice_size = 4

    mapped_headlines = default_scraper(document, 'h3').map do |element|
      element.text.strip[sanitized_range]
    end

    mapped_tables = tables_scraper(document).search('td')
                                            .each_with_index.map do |element, i|
      ethics_content_mapper(i, element, mapped_headlines, slice_size)
    end

    slicer(mapped_tables.compact, slice_size)
  end

  def governments_scraper
    table = tables_scraper('https://stellaris.paradoxwikis.com/Government').first
    slice_size = 7

    mapped_tables = table.search('td').each_with_index.map do |element, i|
      icon_src = element.children.children.attribute('src')
      if (i % slice_size).zero?
        icon_src.value + ', ' + element.text.strip
      else
        element.text.strip
      end
    end

    slicer(mapped_tables, slice_size)
  end

  def origins_scraper
    table = tables_scraper('https://stellaris.paradoxwikis.com/Empire').first
    slice_size = 5

    mapped_tables = table.search('td').each_with_index.map do |element, i|
      icon_src = element.children.children.attribute('src')
      if (67..84).to_a.include?(i)
        nil
      elsif (i % slice_size).zero? && i < 67
        icon_src.value + ', ' + element.text.strip
      elsif ((i - 3) % slice_size).zero? && i > 84
        icon_src.value + ', ' + element.text.strip
      else
        element.text.strip
      end
    end

    slicer(mapped_tables.compact, slice_size)
  end

  def traits_scraper(tables_index, slice_size)
    tables = tables_scraper('https://stellaris.paradoxwikis.com/Traits')
    table = tables[tables_index]

    mapped_tables = table.search('td').each_with_index.map do |element, i|
      traits_content_mapper(i, slice_size, element)
    end

    slicer(mapped_tables, slice_size)
  end

  private

  def default_scraper(url_or_doc, target)
    document = url_or_doc.class == String ? html_doc(url_or_doc) : url_or_doc
    document.search(target)
  end

  def ethics_content_mapper(ind, element, mapped_headlines, slice_size)
    last_gestalt_index = 67
    headline = mapped_headlines[ind / (slice_size * 4)]
    child = ind == 64 ? element.children.children : element.children.children.children
    icon_src = child.attribute('src')

    if ind > last_gestalt_index
      nil
    elsif (ind % slice_size).zero?
      icon_src.value + ', ' + element.text.strip + ', ' + headline
    else
      element.text.strip
    end
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

  def traits_content_mapper(ind, slice_size, element)
    lithoid_restriction = element.children.children.attribute('alt')
    icon_src = element.children.children.children.attribute('src')
    stripped_span_tag = element.text.gsub(' ', '').strip

    if lithoid_restriction
      'x'
    elsif (ind % slice_size).zero?
      icon_src.value + ', ' + stripped_span_tag
    # elsif (ind % slice_size) == 2
    #   element.text.strip.gsub('  ', '')
    elsif icon_src && element.text.strip.empty?
      icon_src.value
    else
      stripped_span_tag
    end
  end
end
