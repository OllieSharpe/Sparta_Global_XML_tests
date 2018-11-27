require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    @xml_menu.get_prices.each do |price|
      expect(price.text.to_i).to be < 10
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    @xml_menu.get_food_entries.each do |item|
      if (@xml_menu.get_name_from(item).text.downcase == "full breakfast")
        expect(@xml_menu.get_calories_from(item).text.to_i).to be >= 1000
      else
        expect(@xml_menu.get_calories_from(item).text.to_i).to be < 1000
      end
    end
  end

  it "should have all waffle dishes stating you get two waffles" do
    @xml_menu.get_food_entries.each do |item|
      if (@xml_menu.waffle_check(@xml_menu.get_name_from(item).text))
        expect(@xml_menu.get_description_from(item).text.downcase).to include('two')
        expect(@xml_menu.get_description_from(item).text.downcase).to include('waffles')
      end
    end
  end

end
