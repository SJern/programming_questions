def check_perm(str1, str2)
  return false unless str1.length == str2.length
  frequency = Hash.new(0)
  str1.each_char { |chr| frequency[chr] += 1 }
  str2.each_char.with_index do |chr, i|
    frequency[chr] -= 1
    return false if frequency[chr] < 0
  end
  true
end

def replaceSpaces(str, true_length)
  idx = str.length - 1
  true_idx = true_length - 1
  while idx >= 0
    if str[true_idx] == ' '
      str[idx] = '0'
      str[idx - 1] = '2'
      str[idx - 2] = '%'
      idx -= 2
    else
      str[idx] = str[true_idx]
    end
    idx -= 1
    true_idx -= 1
  end
  str
end

p replaceSpaces("Mr John Smith    ", 13)
