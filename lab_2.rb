#Задание №1
puts "Введите количество элементов массива и сами элементы"
arr=Array.new(gets.to_i){|i| gets.to_i}
def sum arr
  s=0
  for i in 0...arr.size
    s+=arr[i]
  end
puts(print "Сумма элементов массива = ", s)
end

def mult arr
  m=1
  for i in 0...arr.size
    m*=arr[i]
  end
puts(print "Произведение элементов массива = ", m)
end

def max arr
  max=-1
  for i in 0...arr.size
    if (arr[i]>max)
      max=arr[i]
    end
  end
  puts(print "Максимальный элемент массива = ", max)
  end

def min arr
  min=100000000
  for i in 0...arr.size
    if (arr[i]<min)
      min=arr[i]
      end
    end
    puts(print "Минимальный элемент массива = ", min)
    end

sum arr
mult arr
max arr
min arr
