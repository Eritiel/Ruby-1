#Задание №8

s=String.new(str="5 8 99 4 55 6 1 9 3")
res=s.split(" ").each{|i| i.to_i}.max
puts res
