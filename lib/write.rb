class Write

  def make_file images 
    file_name = './views/ffffiles.html' 

    File.open(file_name, 'w+') do |file|
      file.write "<html><head>"
      file.write "<link rel='stylesheet' href='../assets/style.css'>"
      file.write "<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js'></script>"
      file.write "<script src='../assets/style.js'></script>"
      file.write "</head>"

      file.puts ""
      images.each do |i|
        file.write "<div class='wrapper'>"
        file.write i
        file.write "<p class='like'>like</p>"
        file.write "</div>"
        file.puts ""
      end
      file.puts ""
    end
  end
end
