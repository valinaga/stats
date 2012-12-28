class Download < ActiveRecord::Base


  def upload(file_io)
    Dir["/Users/vali/Downloads/*.csv"].each do |f| 
      puts f
    
    end
    
    File.open(Rails.root.join('public', file_io.original_filename), 'wt', encoding: 'ASCII-8BIT') do |file|
      file.write(file_io.read)
    end
  end


end
