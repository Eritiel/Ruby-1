require 'prime'
#Задание №5
def num n
  puts(n)
end
num 5
n=252
puts(print 65.chr)#1
puts(print 65.denominator)#2
puts(print 65.gcd 15)#3
puts(print 65.gcdlcm 155)#4
puts(print 65.integer?)#5
puts(print 6.lcm 20)#6
puts(print 65.next)#7
puts(print 65.numerator)#8
puts(print 65.prime_division)#9
puts(print 65.round)#10
puts(print 5.times{|i| p i*i})#11
puts(print 65.to_r)#12

#Задание №6
def digits_sum n
  s = n.digits.inject {|sum, num| sum+num}
  return s
end


def digits_mult n #2
  m = n.digits.inject(1) {|prod, num| prod*=num}
  return m
end




def max_dig n
  ma = n.digits.to_a.max
  return ma
end


def min_dig n
  mi = n.digits.to_a.min
  return mi
end


#Задание №7

#Метод 1
=begin
def simple n
  for i in 2..Math.sqrt(n)
      return false   if n%i==0
  end
  return true
end
=end
def simple_sum n
  sum=n.prime_division.inject(0){|s, num| s+=num[0]}
  return sum
end


#Метод 2

def counter n
    k = n.digits.find_all {|elem| (elem.odd?)&&(elem>3)}
    return k.size
end


#Метод 3

def sum_dig n
  s=n.digits.inject(1) {|sum, num| sum+=num}
  return s
end


def mult n
      m=(1..n/2).inject(1){|prod, i| prod*=((sum_dig(i)<sum_dig(n))&&((n%i).zero?)) ? i : 1}
      return m
end


#Задание №8
def select
  method = ARGV[0]
  case method
  when "1"
    puts "Введите число: "
    n=STDIN.gets.chomp.to_i
    digits_sum(n)
    puts(print "Сумма цифр числа #{n}: ", digits_sum(n))
  when "2"
    puts "Введите число: "
    n=STDIN.gets.chomp.to_i
    digits_mult(n)
    puts(print "Произведение цифр числа #{n}: " , digits_mult(n))
  when "3"
    puts "Введите число: "
    n=STDIN.gets.chomp.to_i
    max_dig(n)
    puts(print "Максимальная цифра числа #{n}: ",max_dig(n))
  when "4"
    puts "Введите число: "
    n=STDIN.gets.chomp.to_i
    min_dig(n)
    puts(print "Минимальная цифра числа #{n}: ", min_dig(n))
  when "5"
    puts "Введите число: "
    n=STDIN.gets.chomp.to_i
    simple_sum(n)
    puts (print "Сумма простых делителей числа #{n}: ", simple_sum(n))
  when "6"
    puts "Введите число: "
    n=STDIN.gets.chomp.to_i
    counter(n)
    puts(print "Количество нечетных цифр числа #{n}, больших 3: ", counter(n))
  when "7"
    puts "Введите число: "
    n=STDIN.gets.chomp.to_i
    mult(n)
    puts(print "Произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа #{n}: ", mult(n))
  else
    puts("У данной функции возможны 7 вариантов параметров: ")
    puts("1. Вызов функции поиска суммы цифр числа;")
    puts ("2. Вызов функции поиска произведения цифр числа; ")
    puts ("3. Вызов функции поиска максимальной цифры числа; ")
    puts ("4. Вызов функции поиска минимальнйо цифры числа; ")
    puts ("5. Вызов функции поиска суммы простых делителей числа; ")
    puts ("6. Вызов функции поиска количества нечетных цифр числа, больших 3; ")
    puts ("7. Вызов функции поиска прозведения таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа")
  end
end
select
