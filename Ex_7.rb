
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

 #Задача 37

 def neighbours
   puts "Введите количество элементов массива: "
   size=gets.to_i
   puts "Введите элементы массива: "
   arr=Array.new(size) {|i| gets.to_i}
   puts(print arr)
   less=[]
   k=0
   for i in 1...arr.size
     if(arr[i]<arr[i-1])
       less.push(i)
       k+=1
     end
   end
   puts (print less)
   puts (print "Количество чисел, меньших своих левых соседей: ", k)
 end

 #Задача 49
  def simple n
    for i in 2..Math.sqrt(n)
        return false   if n%i==0
    end
    return true
  end

  def division
    puts "Введите количество элементов массива: "
    size=gets.to_i
    puts "Введите элементы массива: "
    arr=Array.new(size) {|i| gets.to_i}
    puts(print arr)
    div=[]
    for i in 0...arr.size
      for j in 2..arr[i]/2
        if (arr[i]%j==0&&simple(j)==true)
          div.push(j)
        end
      end
    end
    puts(print div.uniq.sort)
  end

  #Хаб

 def hub
   puts "Введите номер решаемой задачи"
   n=gets.to_i
   case n
   when 1
     counter_after_max()
   when 13
     replace()
   when 25
     max_in_range()
   when 37
     neighbours()
   when 49
     division()
   else
     puts ("У данной программы 5 варианта параметров: 1, 13, 25, 37, 49 ")
   end
 end
