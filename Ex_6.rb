
#Задача 1

def count_after_max
  puts "Введите количество элементов массива: "
  size=gets.to_i
  puts "Введите элементы массива: "
  arr=Array.new(size) {|i| gets.to_i}
  puts(print arr)
  max=-1
  k=0
  for i in 0...arr.size
    if (arr[i]>max)
      max=arr[i]
      max_index=i
    end
    if(i>max_index)
      k+=1
    end
  end
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
  min=1000000
  res=[]
  for i in 0...arr.size
    if (arr[i]<min)
      min=arr[i]
      min_index=i
    end
  end
  for j in 0...arr.size
    if (j<min_index)
      arr.push(arr.shift)
    end
  end
  puts(print arr)
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
   max=-1
   range=[]
   for i in 0...arr.size
     if (a<arr[i]&&b>arr[i])
       range.push(arr[i])
     end
   end
   for i in 0...range.size
     if (range[i]>max)
       max=range[i]
     end
   end
   puts(print range)
   puts(print "Максимальный элемент в диапазоне от #{a} до #{b} = ", max)
 end
