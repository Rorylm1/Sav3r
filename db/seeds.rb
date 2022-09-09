# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "starting items"
Shop.destroy_all
Item.destroy_all
puts "destroyed items"
puts "scraping bargains"

url = "https://www.trolley.co.uk/"
html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)
search_results = html_doc.search(".product-item")


puts "scraping categories..."
Item::CATEGORIES.each do |category|


url = "https://www.trolley.co.uk/browse/#{category}"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)
search_results = html_doc.search(".product-item")
search_results.each do |search_result|
  # puts search_result
name = search_result.search("._desc").text.strip
price_string = search_result.search("._price").text.strip
price =  price_string[1..-1].to_f
brand =  search_result.search("._brand").text.strip
volume = search_result.search("._size").text.strip
category = "#{category}"
image_link = search_result.search("._img img")
img = image_link[0].to_s
product_id = img.match(/\w*\d/)
img_url = "https://www.trolley.co.uk/img/product/#{product_id}"
# item_link = search_result.search("a href").text.strip
# puts item_link

Item.create(name: name,
                brand: brand,
                volume: volume,
                category: category,
                price: ('%.2f' % price),
                image: img_url,
                link: product_id.to_s
             )



end
puts "done #{category}"
end
puts "done"

puts "creating initial basket"
# Basket.create!
