require 'launchy'

file = `curl 'http://feeds.feedburner.com/ffffound/everyone'`
item_string = file[830..-42]
item_array = item_string.split("media:content url=")[1..-1]

# Break into methods
# Make sure it pulls right content
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

images = []
  item_array.each do |item|
    short_item = item[0..200]
    end_string = item.index(ext(short_item)) + 2
    file = item[1..end_string]
    img = "<img src=\"" + file + "\" >"
    images << img
  end
  
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

puts 'FFFFetched!'
Launchy.open(Dir.pwd + "/" + file_name)

