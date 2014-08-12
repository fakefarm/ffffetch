module FileHelper

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
end
