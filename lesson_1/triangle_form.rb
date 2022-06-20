puts "What is the demetions of the triangle (separate with the 'Enter')"

a = 3.times.collect { gets.chomp.to_i }

hypotenuse = a.max * a.max
short_side = a.min * a.min
middle_side = hypotenuse - short_side

puts "This triangle with sides #{a}, is:"

if a.uniq.size == 1
  puts "- equilateral (равносторонний);"
end

if a.uniq.size < 3
  puts "- isosceles (равнобедренный);"
end

if a.uniq.size == 3
  puts "- different sides (все стороны разные);"
end

if a.include? Math.sqrt(middle_side)
  puts "- square (прямоугольный);"
end