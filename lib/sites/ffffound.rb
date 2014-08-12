require_relative 'file_helper'

class FFFFound 
  include FileHelper
  
  def initialize
    @images = []
    get_images
    puts 'FFFFetched!'
  end

  def get_images
    get_feed
    clean_feed
    coerce_feed
    compile_images
  end

  def images
    @images
  end

private

  def get_feed
    @file = `curl 'http://feeds.feedburner.com/ffffound/everyone'`
  end

  def clean_feed
    @item_string = @file[830..-42]
  end

  def coerce_feed
    @item_array = @item_string.split("media:content url=")[1..-1]
  end

  def compile_images
    @item_array.each do |item|
      short_item = item[0..200]
      end_string = item.index(ext(short_item)) + 2
      _file = item[1..end_string]
      img = "<img src=\"" + _file + "\" >"
      @images << img
    end
    @images = @images.uniq
  end
end
