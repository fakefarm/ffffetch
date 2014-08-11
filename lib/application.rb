require 'launchy'
require_relative 'sites/ffffound'
require_relative 'write'

class Application

  def initialize
    add_ffffound_to_file
  end

  def open
    file_name = '../views/ffffiles.html' 
    Launch.open(Dir.pwd + "/files" + file_name)
  end

  def get_ffffound
    f = FFFFound.new
    f.images 
  end

  def write_found images
    w = Write.new
    w.make_file images
    # TODO - write fffound.
  end

  def add_ffffound_to_file
    images = get_ffffound
    write_found images
  end

end
