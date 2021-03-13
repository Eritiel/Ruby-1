#Задание №8

s=String.new(str="5 8 99 4 55 6 1 9 3")
max=s.split(" ").each{|i| i.to_i}.max
puts(print "Максимальное значение в строке #{s} = ", max)

#Задание №9

#Задача 1

def rus
  str="ghfkgjаопщщкрерлg"
  amount=str.scan(/[А-я]/).size
  puts(print "Количество русский букв в строке #{str} = ", amount)
end

#Задача 9

def palindrom
  str="abba А РОЗА УПАЛА НА ЛАПУ АЗОРА"
  check=str.scan(/[a-zа-я]/)
  if (check==check.reverse)
    puts "Строчные буквы строки '#{str}' образуют палиндром"
  else
    puts "Строчные буквы строки '#{str}' не образуют палиндром"
  end
end
