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
