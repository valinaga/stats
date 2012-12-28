require 'itunes_ingestion'
require 'csv'

namespace :db do
  desc "Import iTunes stats "
  task :itunes => [:environment] do
  
    #file = "vender/gac.csv"
  
    fetcher = ITunesIngestion::Fetcher.new("vali@cevadesign.ro","Costin2vlad","85600697")
    
    #Itunes.delete_all
    
    start = Itune.maximum('data')
    start = start.nil? ? 15.days.ago.to_date : (start+1).to_date 
    (start..(Date.today).to_date).each do |date| 
      puts date.strftime("%Y%m%d")     
      report_data = fetcher.fetch(:report_date => date.strftime("%Y%m%d"))
      CSV.parse(report_data.gsub("\t",","), {:headers => true}) do |row|
        if row[6].start_with? "1"
          units = row[7]
          upgrades = 0
        else
          upgrades = row[7]
          units = 0
        end
        
        client = Client.find_by_sku(row[2])

        client.itunes.create({
          "sku" => row[2],
          "title" => row[4],
          "units" => units,
          "upgrades" =>upgrades,
          "data" => Date.strptime(row[9], '%m/%d/%Y'),
          "country" => row[12]
        })
      end
    end
  end
end
  