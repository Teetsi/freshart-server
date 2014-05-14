require 'pry'
require 'nokogiri'
require 'open-uri'

def fetch_detailed_information(url)

  find_value = ->(e, key) {
    e.at_xpath("//div[span[@class='event-header-selector' and text() = '#{key}']]/span[@class='event-content-field']").text.strip
  }

  doc = Nokogiri::HTML(open(url))
  result = {}
  doc.css('#event-information').each do |e|
    result = {
      start_date: find_value.call(e, 'Start'),
      end_date: find_value.call(e, 'End'),
      times: find_value.call(e, 'Times'),
      venue: find_value.call(e,'Venue'),
      address: find_value.call(e, 'Address'),
      tel: find_value.call(e, 'Telephone'),
      web_url: find_value.call(e, 'Website'),
      email: find_value.call(e, 'Email'),
      cost: find_value.call(e, 'Cost')
    }
  end

  result['preview_image'] = "http://www.artlyst.com/#{doc.css('.view-page-image img').at_xpath('@src').text}"

  result
end

namespace :data do

  desc "TODO"
  task artlyst_featured: :environment do
    url = "http://www.artlyst.com/featured-exhibitions"

    list = List.find_by_title('featured-exhibitions')
    unless list
      list = List.create({ title: 'featured-exhibitions' })
    end
    #url = "./Featuredevents.html"
    doc = Nokogiri::HTML(open(url))
    #doc = Nokogiri::HTML(File.open(url))
    doc.css('.featuredevents #featuredevents-listings').each do |e|
      content = e.css('.featured-listings-content')
      title = content.css('.event-name').first.text.strip
      venue = content.css('h3 span').first.text.strip
      link = content.css('a').first.at_xpath('@href')
      description = content.css('p').first.text.strip

      exhibition = Exhibition.find_by(title: title, venue: venue)

      # not yet created
      unless exhibition
        params = fetch_detailed_information("http://www.artlyst.com#{link}")
        params['title'] = title
        params['venue'] = venue
        params['description'] = description
        exhibition = Exhibition.create(params)

        puts exhibition
      end

      # not yet added
      unless list.exhibitions.exists?(exhibition.id)
        list.exhibitions << exhibition
      end
      list.save!
    end
  end

end
