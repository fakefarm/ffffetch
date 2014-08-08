file = `curl 'http://feeds.feedburner.com/ffffound/everyone'`

items = file.split("<media:content url=").drop(1) 
images = []
  items.each do |item|
    file = item.split(".jpg")[0][1..-1] 
    img = "<img src=" + file + ".jpg >"
    images << img
  end
  
puts images
File.open('images.html', 'w+') do |file|
  images.each do |i|
    file.write i
  end
end
