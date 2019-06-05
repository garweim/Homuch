require 'open-uri'

class Scraper
  attr_reader :project, :html_doc

  def call(project)
    @project = project
    get_html_doc
    #get_all_projects
    #parse_projects_data
  end

  private

  def get_html_doc
    html_file = open(url)
    @html_doc = Nokogiri::HTML(html_file)
  end

  def get_all_projects
    html_doc.search('.card').map do |app|
      {
        zipcode: get_zipcode,
        surface: get_surface,
        nr_of_bedrooms: get_bedrooms,
        nr_of_bathrooms: get_bathrooms,
        price: get_price
      }

  end

  def parse_projects_data
  end

  def url
  #  "https://immo.vlan.be/en/real-estate/flat?transactiontypes=for-sale,in-public-sale&propertysubtypes=flat---apartment,ground-floor,penthouse,duplex,triplex,flat---studio,loft&regions=brussels-region&minTotalSurface=#{min_surface}&maxTotalSurface=#{max_surface}&noindex=1"
  #  "https://immo.vlan.be/en/real-estate/flat?transactiontypes=for-sale,in-public-sale&propertysubtypes=flat---apartment&bedrooms=#{bedrooms}&bathrooms=#{bathrooms}&regions=brussels-region&minPrice=#{min_price}&maxPrice=#{max_price}&minTotalSurface=#{min_surface}&maxTotalSurface=#{max_surface}&noindex=1"
  #  "https://immo.vlan.be/en/real-estate/flat?transactiontypes=for-sale,in-public-sale&propertysubtypes=flat---apartment&bedrooms=#{bedrooms}&bathrooms=#{bathrooms}&regions=brussels-region&minTotalSurface=#{min_surface}&maxTotalSurface=#{max_surface}&noindex=1"
    "https://immo.vlan.be/en/real-estate/flat?transactiontypes=for-sale,in-public-sale&towns=#{zipcode}-brussels&propertysubtypes=flat---apartment&bedrooms=#{bedrooms}&bathrooms=#{bathrooms}&minTotalSurface=#{min_surface}&maxTotalSurface=#{max_surface}&noindex=1"
  end

  def min_surface
    project.surface - 10
  end

  def max_surface
    project.surface + 10
  end

  def bedrooms
    project.nr_of_bedrooms
  end

  def bathrooms
    project.nr_of_bathrooms
  end

  def zipcode
    project.zipcode
  end

  def get_surface
    app.search(" ").text.strip

  end

  def get_bedrooms
    app.search(" ").text.strip


  end


  def get_bathrooms
    app.search(" ").text.strip


  end


  def get_price
    app.search(".list-item-price").text.strip
  end

  def get_zipcode

  end
end

### SCRAPING INFO ###

# An appartement card has:
#   class="card"
#   itemtype="https://schema.org/Apartment"

# Each appartment card has:
#   Price:
#     class="list-item-price"

#   Surface:
#     title="Livable surface"

#   Bedroom:
#     title="Bedroom(s)"

#   Surface:
#     title="Livable surface"

#   Bathroom:
#     title="Bathroom(s)"

#   zipcode:
#     itemprop="postalCode"


#####################

### REQUIRED OUTPUT ####

# [
#   {
#     zipcode: 1000,
#     surface: 67,
#     nr_of_bedrooms: 3,
#     nr_of_bathrooms: 1,
#     price: 200_000
#   }
# ]

########################


# html_doc.search('.result-xl').each do |element|
#   element.search('.rangePrice') do |price|
#     puts price.text.strip
#   end
# end
