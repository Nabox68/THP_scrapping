require 'open-uri'
require 'nokogiri'

# Je vais définir la page dont je vais prendre ma source
coinmarket_page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

# Je repère la ligne de code des symbole
crypto_name = coinmarket_page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')

#pour afficher uniquement les symboles et non la ligne de code 
c_n_a = crypto_name.map { |symbole| symbole.text}

# Je repère la ligne des valeurs pour les symboles 
crypto_price = coinmarket_page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')

#pour afficher uniquement les valeurs et non la ligne de code 
c_p_a = crypto_price.map { |valeurs| valeurs.text.tr("$","").to_f}

#création du hash
puts crypto_hash =c_n_a.zip(c_p_a).to_h

#division en plein de petits hash
puts crypto_hash =crypto_hash.map { |k, v| { k => v } }

#création d'un array
crypto_array=crypto_hash.to_a

#juste pour vérifier que c'est bien un array
puts crypto_array.class



