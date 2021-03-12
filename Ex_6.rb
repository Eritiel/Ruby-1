
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
