module ApplicationHelper

  def result_html(array)
    total = array.pop
    total = "<td align='left'><strong>Total</strong><br> #{number_with_precision(total[:units], :precision => 0, :delimiter => ',') }</td>"

    week = array.pop
    week = "<td align='left'><strong>Week: #{week[:data].strftime '%W'}</strong> <br> #{number_with_precision(week[:units], :precision => 0, :delimiter => ',')}</td>"

    result =""
    array.each do |day|
      result << "<td align='left'>#{day[:data].strftime '%a'} <br> #{number_with_precision(day[:units], :precision => 0, :delimiter => ',')}</td>"  
    end
    result << week << total
  end

  def result_txt(array)
    total = array.pop
    total = "Total:#{'%3d' % total[:units]}"

    week = array.pop
    week = "W#{week[:data].strftime '%W'}:#{'%3d' % week[:units]}, "

    result =""
    array.each do |day|
      result << "#{day[:data].strftime '%^a'}:#{'%2d' % day[:units]}, "  
    end
    result << week << total
  end

end
