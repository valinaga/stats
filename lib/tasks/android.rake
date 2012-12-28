require 'itunes_ingestion'
require 'csv'

namespace :db do
  desc "Import iTunes files "
  task :android => [:environment] do
  
    lookup = {
      "lamama"=>"LAMAMA",
      "bizdays"=>"BUS",
      "cafepedia"=>"CAFEPEDIA",
      "collage"=>"CLUB",
      "nissanb"=>"NISS",
      "fibrio"=>"FIBR",
      "ladyfit"=>"LADY",
      "magicfm"=>"MAGICFM",
      "drvoicu"=>"DRVO"}
    Android.delete_all

    path ="/Users/vali/Downloads/"
    Dir[path+"*.csv"].each do |f| 
      puts f
      i=0
      sku = ''
      client = nil
      CSV.foreach(f) do |row| 
        if i==1
          sku = row[0].scan(/\w+/)[-2]
          client = Client.find_by_sku(lookup[sku.gsub("app_","")])
        elsif i>4
          client.androids.create({
            "sku" => lookup[sku.gsub("app_","")],
            "data" => Date.strptime(row[0], '%Y%m%d'),
            "daily_device_installs" => row[1], 
            "active_device_installs" => row[2],  
            "daily_user_installs" => row[3], 
            "total_user_installs" => row[4], 
            "active_user_installs" => row[5],  
            "daily_device_uninstalls" => row[6], 
            "daily_user_uninstalls" => row[7], 
            "daily_device_upgrades" => row[8]
          })
        end
        i=i+1
      end  
    end    
  end
end
  