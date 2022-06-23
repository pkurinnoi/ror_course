hash = {}
vowels = ['B', 'C', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'X', 'Z']
i = 0

alphabet = ('A'..'Z').to_a

alphabet.each do |a|
  i += 1
  unless vowels.include? a
    hash[a] = i
  end
end

puts hash

