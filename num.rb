#Задание №5
def num n
  puts(n)
end
num 5

#Задание №6
def digits_sum n
  s=0
  while !(n==0)
    dig=n%10
    s+=dig
    n=n/10
  end
  puts(print "Сумма цифр числа: ", s)
end

def digits_mult n #2
  m=1
  while !(n==0)
    dig=n%10
    m*=dig
    n=n/10
  end
  puts(print "Произведение цифр числа: " , m)
end

digits_sum 252
digits_mult 589

def max_dig n
  max=n%10
  n=n/10;
  while !(n==0)
    if ((n%10)>max)
      max=n%10
    end
    n=n/10
  end
  puts(print "Максимальная цифра числа: ",max)
end

def min_dig n
  min=n%10
  n=n/10;
  while !(n==0)
    if ((n%10)<min)
      min=n%10
    end
    n=n/10
  end
  puts(print "Минимальная цифра числа: ", min)
end

max_dig 12985
min_dig 583

#Задание №7

#Метод 1

def simple n
  for i in 2..Math.sqrt(n)
      return false   if n%i==0
  end
  return true
end

def simple_sum n
  sum=0
  for i in 2..n/2
    if (n%i==0&&simple(i)==true)
      sum+=i
    end
  end
  puts (print "Сумма простых делителей числа: ", sum)
end
simple_sum 6

#Метод 2

def counter n
  k=0
  for i in n.digits
    k += (!(i%2==0)&&i>3) ? 1 : 0
  end
  puts(print "Количество нечетных цифр числа, больших 3: ", k)
end
counter 55
