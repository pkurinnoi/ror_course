cart = {}
$total_price = 0

loop do

  puts "Product name"
  product = gets.chomp.to_str

  break if product == 'stop'

  puts "Product price"
  price = gets.chomp.to_f

  puts "Product quantity"
  qty = gets.chomp.to_f

  cart[product] = {price => qty}

  $total_price += price * qty
end

puts "Cart #{cart}"
puts "Total price: #{$total_price}"
