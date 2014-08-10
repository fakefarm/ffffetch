require 'launchy'
require_relative 'sites/ffffound'
require_relative 'write'

class Application

  def initialize
    get_ffffound
  end

  def open
    file_name = 'ffffiles.html' 
    Launch.open(Dir.pwd + "/files" + file_name)
  end

  def get_ffffound
    f = FFFFound.new
    f.images 
  end

  def write file
    w = Write.new
    # TODO - write fffound.
  end
end
