
namespace :db do
  desc "Send Stats "
  task :sendmail => [:environment] do
    Client.select('name, email').uniq.each do |client|
      puts "#{client[:name]} - #{client[:email]}"
      #if client[:name]  == 'Vali Nissan'
        ClientMailer.stats_email(client).deliver
      #end
    end
  end
end

