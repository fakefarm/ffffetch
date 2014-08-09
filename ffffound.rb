require 'launchy'

class FFFFound
  attr_accessor :file, :item_string, :item_array, :images
  
  def initialize
    @images = []
    get_feed
    clean_feed
    coerce_feed
    compile_images
    make_file
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
  end
  
  def make_file  
    file_name = Time.now.strftime("%F.html")
    File.open(file_name, 'w+') do |file|
      file.write "<html><head>"
      file.write "<link rel='stylesheet' href='style.css'>"
      file.write "<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>"
      file.write "<script src='style.js'></script>"
      file.write "</head>"

      file.puts ""
      images.each do |i|
        file.write i
        file.puts ""
      end
      file.puts ""
      file.write "</body></html>"
    end
    Launchy.open(Dir.pwd + "/" + file_name)
  end
end

FFFFound.new
