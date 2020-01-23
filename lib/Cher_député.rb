require 'open-uri'
require 'nokogiri'

#DECLARATION DE LA METHODE = SEARCH EMAIL
def get_the_email_of_a_townhal_from_its_webpage (url)
  page = open("https://www.annuaire-des-mairies.com/95/.html").read
  nokogiri_object = Nokogiri::HTML(page)
  e_mail_mairie = nokogiri_object.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]")
  return e_mail_mairie.text
end

#DECLARATION DE LA METHODE = SEARCH NAME
def get_the_name_of_a_townhal_from_its_webpage (url)
  page = open("https://www.annuaire-des-mairies.com/95/.html").read
  nokogiri_object = Nokogiri::HTML(page)
  name_mairie = nokogiri_object.xpath("/html/body/div/main/section[1]/div/div/div/h1")
  return name_mairie.text
end

#def get_townhall_hash
page=Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
t_n_a=townhall_name_array=page.xpath('//*[@class="lientxt"]').map { |node| node.text }
t_e_a=townhall_email_array=townhall_name_array.map { |townhall_name| get_townhall_email(townhall_name) }
townhall_hash=t_n_a.zip(t_e_a).to_h
townhall_hash=townhall_hash.map { |key,value| {key=>value} }
#end 

puts 
#puts get_townhall_hash