@a = []

puts "Input A"
@a[0] = gets.chomp.to_i

puts "Input B"
@a[1] = gets.chomp.to_i

puts "Input C"
@a[2] = gets.chomp.to_i

@discr = (@a[1] * @a[1]) - (4 * @a[0] * @a[2])

def print_discr
  puts "Discrymenant = #{@discr}"
end

def print_root1
  @root1 = (-@a[1] + Math.sqrt(@discr)) / (2 * @a[0])
  puts "Root 1 (x1) = #{@root1}"
end

def print_root2
  @root2 = (-@a[1] - Math.sqrt(@discr)) / (2 * @a[0])
  puts "Root 2 (x2) = #{@root2}"
end

if @discr > 0
    print_discr
    print_root1
    print_root2
elsif @discr < 0
    print_discr
    puts "No equation roots (Корней нет)"
else
    print_discr
    print_root1
end
