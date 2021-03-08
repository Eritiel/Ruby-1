
def num n
  puts(n)
end
num 5

def digits n
  s=0
  m=1
  while !(n==0)
    dig=n%10
    s+=dig
    m*=dig
    n=n/10
  end
  puts(print "Сумма = ", s)
  puts(print "Произведение = " , m)
end
digits 252

def max_dig n
  max=n%10
  n=n/10;
  while !(n==0)
    if ((n%10)>max)
      max=n%10
    end
    n=n/10
  end
  puts(print "Максимальная цифра числа = ",max)
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
  puts(print "Минимальная цифра числа = ", min)
end

max_dig 12985
min_dig 583
