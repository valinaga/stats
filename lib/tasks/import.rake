require 'itunes_ingestion'
require 'csv'

namespace :db do
  desc "Import iTunes files "
  task :import => [:environment] do
  
    # Itunes.delete_all
    # Itunes.create({
      # "sku" => "LAMAMA","title" => "Restaurant La Mama",
      # "units" => 17,
      # "upgrades" => 0, "data" => Date.strptime("09/16/2012", '%m/%d/%Y'), "country" => "RO"
    # })
    # Itunes.create({
      # "sku" => "MAGICFM", "title" => "Magic.FM",
      # "units" => 126,
      # "upgrades" => 0, "data" => Date.strptime("09/16/2012", '%m/%d/%Y'), "country" => "RO"
    # })
# 
    # Itunes.create({
      # "sku" => "LAMAMA","title" => "Restaurant La Mama",
      # "units" => 19,
      # "upgrades" => 0, "data" => Date.strptime("09/25/2012", '%m/%d/%Y'), "country" => "RO"
    # })
    # Itunes.create({
      # "sku" => "MAGICFM", "title" => "Magic.FM",
      # "units" => 88,
      # "upgrades" => 0, "data" => Date.strptime("09/25/2012", '%m/%d/%Y'), "country" => "RO"
    # })
# 
    # Itunes.create({
      # "sku" => "LAMAMA","title" => "Restaurant La Mama",
      # "units" => 15,
      # "upgrades" => 0, "data" => Date.strptime("09/26/2012", '%m/%d/%Y'), "country" => "RO"
    # })
    # Itunes.create({
      # "sku" => "MAGICFM", "title" => "Magic.FM",
      # "units" => 56,
      # "upgrades" => 0, "data" => Date.strptime("09/26/2012", '%m/%d/%Y'), "country" => "RO"
    # })
# 
    # Itunes.create({
      # "sku" => "LAMAMA","title" => "Restaurant La Mama",
      # "units" => 13,
      # "upgrades" => 0, "data" => Date.strptime("09/27/2012", '%m/%d/%Y'), "country" => "RO"
    # })
    # Itunes.create({
      # "sku" => "MAGICFM", "title" => "Magic.FM",
      # "units" => 47,
      # "upgrades" => 0, "data" => Date.strptime("09/27/2012", '%m/%d/%Y'), "country" => "RO"
    # })
# 
    # Itunes.create({
      # "sku" => "LAMAMA","title" => "Restaurant La Mama",
      # "units" => 9,
      # "upgrades" => 0, "data" => Date.strptime("09/28/2012", '%m/%d/%Y'), "country" => "RO"
    # })
    # Itunes.create({
      # "sku" => "MAGICFM", "title" => "Magic.FM",
      # "units" => 41,
      # "upgrades" => 0, "data" => Date.strptime("09/28/2012", '%m/%d/%Y'), "country" => "RO"
    # })
    # Itunes.create({
      # "sku" => "CAFEPEDIA", "title" => "Cafepedia",
      # "units" => 2,
      # "upgrades" => 0, "data" => Date.strptime("09/28/2012", '%m/%d/%Y'), "country" => "RO"
    # })
# 
    # Itunes.create({
      # "sku" => "LAMAMA","title" => "Restaurant La Mama",
      # "units" => 13,
      # "upgrades" => 0, "data" => Date.strptime("09/29/2012", '%m/%d/%Y'), "country" => "RO"
    # })
    # Itunes.create({
      # "sku" => "MAGICFM", "title" => "Magic.FM",
      # "units" => 72,
      # "upgrades" => 0, "data" => Date.strptime("09/29/2012", '%m/%d/%Y'), "country" => "RO"
    # })

    path ="/Users/vali/Google Drive/bizness apps/Stats/daily/"
    Dir[path+"*.txt"].each do |f| 
      puts f
      CSV.foreach(f, {:headers => true, :col_sep => "\t"}) do |row| 
        if row[6].start_with? "1"
          units = row[7]
          upgrades = 0
        else
          upgrades = row[7]
          units = 0
        end

        # Itunes.create({
          # "sku" => row[2],
          # "title" => row[4],
          # "units" => units,
          # "upgrades" =>upgrades,
          # "data" => Date.strptime(row[9].gsub(/\/12$/,"/2012"), '%m/%d/%Y'),
          # "country" => row[12]
        # })
      end  
    end    
  end
end
  