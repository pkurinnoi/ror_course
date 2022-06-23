a = []

(10..100).each do |var|
  if var.remainder(5) == 0
    a.push(var)
  end
end

puts a
