require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def get_full_menu
    @menu.xpath('//breakfast_menu')
  end

  def get_full_menu
    @menu.xpath('//breakfast_menu')
  end

  def get_food_entries
    @menu.xpath('//food')
  end

  def get_names
    @menu.xpath('//name')
  end

  def get_prices
    @menu.xpath('//price')
  end

  def get_descriptions
    @menu.xpath('//description')
  end

  def get_calories
    @menu.xpath('//calories')
  end

  def waffle_check(string)
    if (string.include?('Waffles') || string.include?('waffles'))
      return true
    end
  end

end
