require 'prime'
#Задача 1

def count_after_max
  puts "Введите количество элементов массива: "
  size=gets.to_i
  puts "Введите элементы массива: "
  arr=Array.new(size) {|i| gets.to_i}
  puts(print arr)
  max=arr.max
  max_index=arr.index(max)
  k=arr.select{|i| arr.index(i)>max_index}.size
  if(max==arr.last)
    puts "Максимум является последним элементом массива"
  elsif
    puts k
  end
end
#Задача 13

def replace
  puts "Введите количество элементов массива: "
  size=gets.to_i
  puts "Введите элементы массива: "
  arr=Array.new(size) {|i| gets.to_i}
  puts(print arr)
  min=arr.min
  min_index=arr.index(min)
  res=arr.select{|i| arr.index(i)<min_index}.map{|x| arr.push(arr.shift)}.flatten.uniq
  puts(print res)
end


#Задача 25

 def max_in_range
   puts "Введите количество элементов массива: "
   size=gets.to_i
   puts "Введите элементы массива: "
   arr=Array.new(size) {|i| gets.to_i}
   puts(print arr)
   puts "Введите a: "
   a=gets.to_i
   puts "Введите b: "
   b=gets.to_i
   #if(a<arr[0]&&b>arr[arr.size-1])
    # abort "Интервал выходит за пределы массива. Введите другие границы."
   #else
  puts "Искомый интервал: [#{a} ; #{b}]"
  # end
  range=arr.select{|elem| (a..b).include?(elem)}
  max=arr.select{|elem| (a..b).include?(elem)}.max
   puts(print range)
   puts(print "Максимальный элемент в диапазоне от #{a} до #{b} = ", max)
 end



 #Задача 37

 def neighbours
   puts "Введите количество элементов массива: "
   size=gets.to_i
   puts "Введите элементы массива: "
   arr=Array.new(size) {|i| gets.to_i}
   puts(print arr)
   less=(1...arr.size).select{|x| arr[x]<arr[x-1]}
   k=(1...arr.size).select {|x| arr[x]<arr[x-1]}.size
   puts (print less)
   puts (print "Количество чисел, меньших своих левых соседей: ", k)
 end

 #Задача 49

  def division
    puts "Введите количество элементов массива: "
    size=gets.to_i
    puts "Введите элементы массива: "
    arr=Array.new(size) {|i| gets.to_i}
    puts(print arr)
    div=arr.map{|elem| elem.prime_division}.flatten.uniq.reject{|item| item==1}
    puts(print div)
  end

  #Хаб

 def hub
   puts "Введите номер решаемой задачи"
   n=gets.to_i
   case n
   when 1
     puts "Задача №1"
     counter_after_max()
   when 13
     puts "Задача №13"
     replace()
   when 25
     puts "Задача №25"
     max_in_range()
   when 37
     puts "Задача №37"
     neighbours()
   when 49
     puts "Задача №49"
     division()
   else
     puts ("У данной программы 5 варианта параметров: 1, 13, 25, 37, 49 ")
   end
 end
 hub
