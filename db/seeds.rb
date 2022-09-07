# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "starting"
Item.destroy_all
puts "destroyed"
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

Item.create(name: name,
                brand: brand,
                volume: volume,
                category: category,
                price: ('%.2f' % price),
                image: img_url
             )



end
puts "done #{category}"
end
puts "done"
