# require 'open-uri'
require 'nokogiri'

class Scraper
  attr_reader :project, :html_doc, :attributes
  attr_writer :attributes
  ZIPCODE = [1000, 1020, 1030, 1040, 1050, 1060, 1070, 1080, 1090, 1120, 1130, 1140, 1150, 1160, 1170, 1180, 1190, 1200, 1210]
    # PAGES = ["", ",2", ",3", ",4", ",5", ",6", ",7", ",8"]
    # ZIPCODE = [1000, 1020, 1030]
  PAGES = ["", ",2", ",3", ",4", ",5", ",6", ",7"]

  def call(zipcode, type)
    @zipcode = zipcode
    PAGES.each do |page|
      url_sale = "https://www.logic-immo.be/en/buy/apartments-for-sale/-#{@zipcode}#{page}.html"
      url_rent = "https://www.logic-immo.be/en/rent/apartments-for-rent/-#{@zipcode}#{page}.html"
      if type == "sale"
        @url = url_sale
      else
        @url = url_rent
      end
      @html_doc = Nokogiri::HTML(HTTParty.get(@url).body)
      scrape_houses(type, @zipcode, @html_doc)
    end
    #parse_projects_data
  end

  def self.scrape(type)
    puts "launch scraper"
    if type == "sale"
      ZIPCODE.each do |zip|
        Scraper.new.call(zip, type)
        puts "scraped zipcode #{zip}"
      end
    elsif type == "rent"
      ZIPCODE.each do |zip|
        Scraper.new.call(zip, type)
        puts "scraped zipcode #{zip}"
      end
    end
  end

  private

  # def url
  # "https://www.immoweb.be/en/search/apartment/for-sale/brussels/#{zipcode}?minroom=#{min_bedrooms}&maxroom=#{max_bedrooms}"
  # "https://www.logic-immo.be/en/buy/house-for-sale/brussels-#{zipcode}.html"
  # end

  # def get_html_doc
  #   html_file = open(url)
  #   @html_doc = Nokogiri::HTML(html_file)
  # end

  def scrape_houses(type, zipcode, html_doc)
    html_doc.search('div.list-group-item div.property-description').each do |house|
      # p house
      house_link = house.search("a").first.attribute("href").value
      url = "https://www.logic-immo.be#{house_link}"
      house_doc = Nokogiri::HTML(HTTParty.get(url).body)
      house_details = house_doc.search("#property-details-icons")
      attributes = {
        zipcode: zipcode,
        surface: get_surface(house_details),
        nr_of_bedrooms: get_bedrooms(house_details),
        nr_of_bathrooms: get_bathrooms(house_details),
        price: get_price(house_doc)
      }
      attributes
      create_object(type, attributes)
    end
  end

  def create_object(type, attributes)
    if type == "sale"
      SellMarket.find_or_create_by!(attributes)
    elsif type == "rent"
      RentalMarket.find_or_create_by!(attributes)
    end
  end

  def get_surface(house_details)
    surface = house_details.search(".area p")[0]
    return surface.text.strip.gsub(/[^\d]/, '').to_i if surface

    nil
  end

  def get_bedrooms(house_details)
    bedrooms = house_details.search(".nb_bedrooms p")[0]
    return bedrooms.text.strip.gsub(/[^\d]/, '').to_i if bedrooms

    nil
  end

  def get_bathrooms(house_details)
    bathrooms = house_details.search(".nb_bath p")[0]
    return bathrooms.text.strip.gsub(/[^\d]/, '').to_i if bathrooms

    nil
  end

  def get_price(house_doc)
    price = house_doc.search(".c-details_title > span")[0]
    return price.text.strip.gsub(/[^\d]/, '').to_i if price

    nil
  end
end
