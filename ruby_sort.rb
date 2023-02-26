number_array = [3, 5, 9, 7, 1]

number_array_size = number_array.size

number_array_size.times do |i|
  (number_array_size - (i + 1)).times do |j|
    if number_array[j] > number_array[j + 1]
      tmp = number_array[j]
      number_array[j] = number_array[j + 1]
      number_array[j + 1] = tmp
    end
  end
end

p number_array
