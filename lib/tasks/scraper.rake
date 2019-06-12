namespace :scraper do
  desc "TODO"
  task scrape_all: :environment do
    Scraper.scrape("sale")
    Scraper.scrape("rent")
  end
end
