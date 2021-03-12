#Задание #2
=begin
puts "Введите количество элементов массива и сами элементы"
arr=Array.new(gets.to_i){|i| gets.to_i}

def sum arr
  s=arr.inject {|sum, elem| sum+=elem}
puts(print "Сумма элементов массива = ", s)
end

def mult arr
  m=arr.inject(1) {|prod, elem| prod*=elem}
puts(print "Произведение элементов массива = ", m)
end

def max arr
  max=arr.max
  puts(print "Максимальный элемент массива = ", max)
  end

def min arr
  min=arr.min
  puts(print "Минимальный элемент массива = ", min)
    end

sum arr
mult arr
max arr
min arr
=end

#Задание №3
def  input n
  puts "Введите элементы массива: "
  arr=Array.new(n){|i| gets.to_i}
  puts(print arr)
  #Способ №1
  puts "arr << elem"
  puts(print arr << gets.to_i)
  #Способ №2
  puts "arr + other_arr"
  puts(print arr+=[6])
  #Способ №3
  puts "arr.push(elem)"
  puts (print arr.push(gets.to_i))
  #Способ №4
  puts "arr[last_i+1]=elem"
  arr[arr.length]=gets.to_i
  puts(print arr)
  #Cпособ №5
  puts "arr.insert elem"
  puts(print arr.insert(7,9))
  #Способ №6
  puts "arr.unshift(elem)"
  puts (print arr.unshift(1))
end
input 3

#Задание 4
def file
  string=File.open('test.txt', 'r:UTF-8') {|file| file.read}
  s=string.split('').map(&:to_i)
  puts (print s)
end

#Задание №5
def select n,path
  case n
  when 1
    puts "Введите количество элементов массива: "
    size=gets.to_i
    puts "Введите элементы массива: "
    arr=Array.new(size) {|i| gets.to_i}
    puts(print arr)
  when 2
    string=File.open(path, 'r:UTF-8') {|file| file.read}
    s=string.split('').map(&:to_i)
    puts(print s)
  end
end
select 2,'test.txt'
