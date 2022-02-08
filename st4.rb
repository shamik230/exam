def fact(n)
  (1..n).reduce(:*)
end

def num_digits(num)
  Math.log10(num).to_i + 1
end

def binomial(n,k)
  return 1 if n-k <= 0
  return 1 if k <= 0
  fact(n) / ( fact(k) * fact( n - k ) )
end
  
def triangle(nth_line)
  (0..nth_line).map { |e| binomial(nth_line, e) }
end

sum = 0
number = 1653

0.upto(number - 1) do |i|
  sum += triangle(i).inject{|s, n| s += num_digits(n)}
  p "iter #{i}"
end

p sum