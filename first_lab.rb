#Задание №1
puts "Hello, world!" #Вывод на экран "Hello World" с помощью функции print
#Задание №2
def greetings(name)
  print("Приветствую, ", name)
end
puts greetings("Кирилл")

=begin
Здесь будут рассмотрены методы класса string
=end
str1="What is dead "
str2="may never die"
puts String.new(str1) #1
puts "%05d" % 546 #2
puts "%-5s: %08x" % ["No", 123]
puts str1 * 2 #3
puts str1 + str2 #4
puts "What is dead " << "may never die " << 220 #5
puts str1 <=> str2 #6
puts str1 == str2 #7
puts str1[5]#8
puts (print str2.split(" ")) #9
puts (print str2.scan(/[a-zA-Z]/)) #10
puts (print str2.reverse) #11
puts (print str2.ascii_only?)#12
puts(print str2.capitalize)#13
puts(print str2.center(18,"|"))#14
puts(print str2.chars)#15
puts(print "Hello\n".chomp)#16
puts(print str2.chop)#17
puts(print str2.chr)#18
puts(print "What is dead".clear)#19
puts(print "What is dead ".concat(str2))#20
puts(print str2.count("e"))#21
puts(print str2.crypt("g56j"))#22
puts(print str2.delete("a"))#23
puts(print str1.downcase)#24
puts(print str2.dump)#25
puts str1.each_byte{|c| print c, " "}#26
puts(print str2.empty?)#27
puts(print str1.eql?(str2))#28
puts(print str1.gsub(/[aei]/,"*"))#29
puts(print str1.hash)#30
puts(print "245".hex)#31
puts(print str2.include?("ma"))#32
puts(print str1.index("a"))#33
puts(print "may never die".insert(3,"h"))#34
puts(print str2.inspect)#35
puts(print "pupa".intern)#36
puts(print str2.size)#37
puts(print str2.ljust(20,"|"))#38
puts(print "   lupa    ".lstrip)#39
puts(print str2.next)#40
puts(print "5252352".oct)#41
puts(print "m".ord)#42
puts(print "pupa".replace("lupa"))#43
puts(print str1.rindex("a"))#44
puts(print str2.rjust(20,"|"))#45
puts(print "  Oh hi  ".rstrip)#46
puts(print str2.slice(-6,2))#47
puts(print "Mooooooooooooooon".squeeze)#48
puts(print str2.sub(/[e]/, "3"))#49
puts(print str1.swapcase)#50









#Задание №3
puts "Введите свой любимый язык программирования"
name=gets.chomp()
case name
when "Ruby"
  puts "Подлиза!"
when "C++"
  puts "Скоро будет Ruby :)"
when "C#"
  puts "Это вы пока Ruby не видели :)"
when "Python"
  puts "Ruby!"
when "Prolog"
  puts "Уже близко..."
end
=begin
if name=="Ruby"
  puts "Подлиза!"
elsif name=="C++"
  puts "Скоро будет Ruby :)"
elsif name=="C#"
  puts "Это вы пока Ruby не видели :)"
elsif name=="Python"
  puts "Ruby!"
elsif name=="Prolog"
  puts "Уже близко..."
end
=end
#Задание №4
puts"Введите команду операционной системы: "
system STDIN.gets
puts "Введите команду Ruby: "
eval STDIN.gets
