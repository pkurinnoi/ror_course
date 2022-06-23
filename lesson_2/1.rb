year = { "January" => 31, "February" => 28, "March" => 31, "April" => 30, "May" => 31, "June" => 30, "July" => 31, "August" => 31, "September" => 30, "October" => 31, "November" => 30, "December" => 31 }

a_year = year.to_a

puts "Months with 30 days in:"
a_year.each do |m|
  if m[1] == 30
    puts "- #{m[0]}"
  end
end
