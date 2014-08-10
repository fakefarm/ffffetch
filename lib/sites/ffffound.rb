class FFFFound
  attr_accessor :file, :item_string, :item_array, :images
  
  def initialize
    @images = []
    get_feed
    clean_feed
    coerce_feed
    compile_images
    puts 'FFFFetched!'
  end

  def get_feed
    @file = `curl 'http://feeds.feedburner.com/ffffound/everyone'`
  end

  def clean_feed
    @item_string = @file[830..-42]
  end

  def coerce_feed
    @item_array = @item_string.split("media:content url=")[1..-1]
  end

  def ext(item)
    if item.include? 'jpg'
      'jpg'
    elsif item.include? 'png'
      'png'
    elsif item.include? 'gif'
      'gif'
    else
      ''
    end
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
