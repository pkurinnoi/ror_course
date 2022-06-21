puts "Hello! What is your name?"
name = gets.chomp

puts "What is your height?"
height = gets.chomp.to_f

if height < 110
  puts "#{name}, your weight is ideal"
else
  puts "#{name}, your ideal weight is #{(height - 110) * 1.15} kg"
end