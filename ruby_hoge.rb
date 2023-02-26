str = ARGV[0]

array = str.delete(",").delete(".").split(" ").map { |w| w.length }

p array
