require 'prime'
#Задание №5
def num n
  puts(n)
end
num 5

#Задание №6
def digits_sum n
  s=n.digits.inject {|sum, num| sum+num}
  puts(print "Сумма цифр числа #{n}: ", s)
end

def digits_mult n #2
  m=n.digits.inject(1) {|prod, num| prod*=num}
  puts(print "Произведение цифр числа #{n}: " , m)
end

digits_sum 252
digits_mult 589

def max_dig n
  ma=n.digits.to_a.max

  puts(print "Максимальная цифра числа #{n}: ",ma)
end

def min_dig n
  mi=n.digits.to_a.min
  puts(print "Минимальная цифра числа #{n}: ", mi)
end

max_dig 12985
min_dig 583

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
  puts (print "Сумма простых делителей числа #{n}: ", sum)
end
simple_sum 30

#Метод 2

def counter n
    k = n.digits.find_all {|elem| (elem.odd?)&&(elem>3)}
  puts(print "Количество нечетных цифр числа #{n}, больших 3: ", k.size)
end
counter 55

#Метод 3

def sum_dig n
  s=n.digits.inject(1) {|sum, num| sum+=num}
  return s
end


def mult n
      m=(1..n/2).inject(1){|prod, i| prod*=((sum_dig(i)<sum_dig(n))&&((n%i).zero?)) ? i : 1}
  puts(print "Произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа #{n}: ", m)
end
mult 225

#Задание №8
def select
  puts("Введите число: ")
  n=gets.to_i
  puts("Введите номер метода (от 1 до 7): ")
  nom = gets.to_i
  case nom
  when 1
    digits_sum(n)
  when 2
    digits_mult(n)
  when 3
    max_dig(n)
  when 4
    min_dig(n)
  when 5
    simple_sum(n)
  when 6
    counter(n)
  when 7
    mult(n)
  else
    puts("У данной функции возможны 7 вариантов параметров: ")
    puts("1. Вызов функции поиска суммы цифр числа;")
    puts ("2. Вызов функции поиска произведения цифр числа; ")
    puts ("3. Вызов функции поиска максимальной цифры числа; ")
    puts ("4. Вызов функции поиска минимальнйо цифры числа; ")
    puts ("5. Вызов функции поиска суммы простых делителей числа; ")
    puts ("6. Вызов функции поиска количества нечетных цифр числа, больших 3; ")
    puts ("7. Вызов функции поиска прозведения таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа")
    select
  end
end
select
