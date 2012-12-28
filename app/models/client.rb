class Client < ActiveRecord::Base
  has_many :itunes
  has_many :itunes_weeks
  has_many :androids
  
  Lookup = {
    "lamama"=>"LAMAMA",
    "bizdays"=>"BUS",
    "cafepedia"=>"CAFEPEDIA",
    "collage"=>"CLUB",
    "nissanb"=>"NISS",
    "fibrio"=>"FIBR",
    "ladyfit"=>"LADY",
    "magicfm"=>"MAGICFM",
    "drvoicu"=>"DRVO"
  }

  def apps
    Client.find_all_by_name(self.name)
  end
  
  def weekly_android
    week_a = self.androids.select('data, sum(daily_user_installs) as units').group(:data).where("data > '#{Android.maximum(:data) - 7.days}'")
    #week_a = [] if week_a.nil?
    week_a << self.androids.select("max(data) as data, sum(IF(data > '#{Android.maximum(:data) - 7.days}', daily_user_installs, 0)) as units").first
    week_a << self.androids.select('max(data) as data, sum(daily_user_installs) as units').first
    week_a.compact
  end
  
  def weekly_itunes
    week_i = self.itunes.select('data, sum(units) as units').group(:data).where("data > '#{Itune.maximum(:data) - 7.days}'")
    #week_i = [] if week_i.nil?
    week_i << self.itunes.select("max(data) as data, sum(IF(data > '#{Itune.maximum(:data) - 7.days}', units, 0)) as units").first
    week_i << self.itunes.select('max(data) as data, sum(units) as units').first
    week_i.compact
  end
  
  def result(array)
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


