
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
