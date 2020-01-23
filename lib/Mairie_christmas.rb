require 'open-uri'
require 'nokogiri'
require 'pry'


def get_townhall_email(town_name)
town_name=town_name.downcase.tr(" ","-")
page=Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/#{town_name}.html"))
search_email=page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
return search_email
end

  
def get_townhall_hash
page=Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
t_n_a=townhall_name_array=page.xpath('//*[@class="lientxt"]').map { |node| node.text }
t_e_a=townhall_email_array=townhall_name_array.map { |townhall_name| get_townhall_email(townhall_name) }
townhall_hash=t_n_a.zip(t_e_a).to_h
townhall_hash=townhall_hash.map { |key,value| {key=>value} }
townhall_array=townhall_hash.to_a
return townhall_array.class
return townhall_array
end 

puts townhall_array