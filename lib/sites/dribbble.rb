require_relative 'site'

class Dribbble < Site
  attr_reader :dribbbles
  attr_accessor :file, :item_string, :item_array, :images

  def initialize

    @images = []
    get_feed
    clean_feed
    coerce_feed
    compile_images
    puts 'Dribbbled'
  end

  def get_feed
    @file = `curl https://dribbble.com/shots`
  end

  def clean_feed
    @dribbbles = @file[@start_ol..@end_ol]
  end

  def coerce_feed
  end

private

  def get_start_string
    @start_ol = @file.index('<ol class=')
  end

  def end_string
    @end_ol = @file.index('</ol>') + 4
  end
end
