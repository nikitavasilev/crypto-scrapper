require 'nokogiri'
require 'open-uri'

class StartScrap
  def initialize
    @currency_price = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".price")
	  @currency_name = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")).css(".currency-name-container")
	  @prices = []
	  @names = []
  end

  def perform
    @currency_name.each do |link|
    	update = link.text
    	@names << update
  	end
  	
  	@currency_price.each do |link|
    	update = link.text
    	@prices << update
  	end
    save
  end

  def save
    hash = Hash[@names.zip(@prices)]
  	return hash
  end
end