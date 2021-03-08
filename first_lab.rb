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
str2="may never die "
puts String.new(str1) #1
puts "%05d" % 546 #2
puts "%-5s: %08x" % ["No", 123]
puts str1 * 2 #3
puts str1 + str2 #4
puts str1 << "may never die " << 220 #5
puts str1 <=> str2 #6
puts str1 == str2 #7
puts str1[5]#8
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
