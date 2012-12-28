require 'itunes_ingestion'
require 'csv'

namespace :db do
  desc "Import iTunes stats "
  task :itunes_weekly => [:environment] do
  
    fetcher = ITunesIngestion::Fetcher.new("vali@cevadesign.ro","Costin2vlad","85600697")
    
    # ItunesWeek.delete_all

    # ItunesWeek.new({
          # "sku" => "LAMAMA", "title" => "Restaurant La Mama",
          # "units" => 219,
          # "upgrades" => 0,
          # "date_start" => Date.strptime('06/25/2012', '%m/%d/%Y'),
          # "date_end" => Date.strptime('07/01/2012', '%m/%d/%Y'),
          # "country" => 'RO'
        # }).save!
    # ItunesWeek.new({
          # "sku" => "LAMAMA", "title" => "Restaurant La Mama",
          # "units" => 107,
          # "upgrades" => 0,
          # "date_start" => Date.strptime('07/02/2012', '%m/%d/%Y'),
          # "date_end" => Date.strptime('07/08/2012', '%m/%d/%Y'),
          # "country" => 'RO'
        # }).save!
    # ItunesWeek.new({
          # "sku" => "LAMAMA", "title" => "Restaurant La Mama",
          # "units" => 115,
          # "upgrades" => 0,
          # "date_start" => Date.strptime('07/09/2012', '%m/%d/%Y'),
          # "date_end" => Date.strptime('07/15/2012', '%m/%d/%Y'),
          # "country" => 'RO'
        # }).save!
    # ItunesWeek.new({
          # "sku" => "LAMAMA", "title" => "Restaurant La Mama",
          # "units" => 91,
          # "upgrades" => 0,
          # "date_start" => Date.strptime('07/16/2012', '%m/%d/%Y'),
          # "date_end" => Date.strptime('07/22/2012', '%m/%d/%Y'),
          # "country" => 'RO'
        # }).save!
    # ItunesWeek.new({
          # "sku" => "LAMAMA", "title" => "Restaurant La Mama",
          # "units" => 95,
          # "upgrades" => 0,
          # "date_start" => Date.strptime('07/23/2012', '%m/%d/%Y'),
          # "date_end" => Date.strptime('07/29/2012', '%m/%d/%Y'),
          # "country" => 'RO'
        # }).save!
    # ItunesWeek.new({
          # "sku" => "LAMAMA", "title" => "Restaurant La Mama",
          # "units" => 111,
          # "upgrades" => 0,
          # "date_start" => Date.strptime('07/30/2012', '%m/%d/%Y'),
          # "date_end" => Date.strptime('08/05/2012', '%m/%d/%Y'),
          # "country" => 'RO'
        # }).save!
    # ItunesWeek.new({
          # "sku" => "LAMAMA", "title" => "Restaurant La Mama",
          # "units" => 110,
          # "upgrades" => 0,
          # "date_start" => Date.strptime('08/06/2012', '%m/%d/%Y'),
          # "date_end" => Date.strptime('08/12/2012', '%m/%d/%Y'),
          # "country" => 'RO'
        # }).save!
    
    start = ItunesWeek.maximum('date_end')
    start = start.nil? ? Date.parse("19/08/2012").to_date : (start+7).to_date 
    (start..(Date.today-1).to_date).step(7) do |date| 
      puts date.strftime("%Y%m%d")     
      report_data = fetcher.fetch(:report_date => date.strftime("%Y%m%d"), :date_type => "Weekly")
      CSV.parse(report_data.gsub("\t",","), {:headers => true}) do |row|
        if row[6].start_with? "1"
          units = row[7]
          upgrades = 0
        else
          upgrades = row[7]
          units = 0
        end
        client = Client.find_by_sku(row[2])
        client.itunes_weeks.create({
          "sku" => row[2],
          "title" => row[4],
          "units" => units,
          "upgrades" =>upgrades,
          "date_start" => Date.strptime(row[9], '%m/%d/%Y'),
          "date_end" => Date.strptime(row[10], '%m/%d/%Y'),
          "country" => row[12]
        })
      end
    end
  end
end
  