class Prime
  def self.nth(num)
    raise ArgumentError if num <= 0
    return 2 if num == 1
    primes = [2]
    i = 3
    while primes.length < num
      primes << i if check_prime(i, primes)
      i += 2
    end
    primes[-1]
  end

  def self.check_prime(num, primes)
    upper_limit = Math.sqrt(num)
    primes.each do |prime|
      return false if num % prime == 0
      return true unless prime < upper_limit 
    end
  end
end
