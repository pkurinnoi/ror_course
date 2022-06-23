calendar = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31 } Не високосный год
$days = 0

puts "What day is today (1-31)?"
day = gets.chomp.to_i

puts "What month is now (1-12)?"
month = gets.chomp.to_i

puts "What year is now?"
year = gets.chomp.to_i

(1..month - 1).each do | m |
  $days += calendar[m]
end

$days += day # номер дня в НЕ високосном году

if month > 2 # проверка на необходимость считать високосный год
  if year.remainder(4) == 0
    if year.remainder(100) == 0
      if year.remainder(400) == 0
        $days += 1
        puts "Високосный год"
      end
    else
      $days += 1
      puts "Високосный год"
    end
  end
end

puts $days
