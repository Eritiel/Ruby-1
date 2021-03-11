#Задание #2
puts "Введите количество элементов массива и сами элементы"
arr=Array.new(gets.to_i){|i| gets.to_i}
puts 
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
