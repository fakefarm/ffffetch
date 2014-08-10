class Dribbble
  attr_reader :dribbbles

  def initialize
    get_popular
    get_start_string
    end_string
    raw_dribbbles
    puts 'Dribbbled'
  end

  def get_popular
    @file = `curl https://dribbble.com/shots`
  end

  def get_start_string
    @start_ol = @file.index('<ol class=')
  end

  def end_string
    @end_ol = @file.index('</ol>') + 4
  end

  def raw_dribbbles
    @dribbbles = @file[@start_ol..@end_ol]
  end
end
