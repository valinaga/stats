class ClientMailer < ActionMailer::Base
  default from: "office@cevadesign.ro"
  add_template_helper(ApplicationHelper)
  
  def stats_email(client)
    @clients = Client.find_all_by_name(client[:name])
    @client = client
    @skus = Client::Lookup.keys
    email_with_name = "#{client[:name]} <#{client[:email]}>"
    mail(:to => email_with_name, :subject => "Statistici Aplicatii")
  end
end
