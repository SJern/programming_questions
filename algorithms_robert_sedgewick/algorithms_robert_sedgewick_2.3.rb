def partition(array, lo=0, hi=array.length-1, &prc)
  return lo if lo == hi
  pivot = array[lo]
  i = lo
  until hi < i
    if prc.call(array[i], pivot) == -1
      array[lo], array[i] = array[i], array[lo]
      lo += 1
      i += 1
    elsif prc.call(array[i], pivot) == 1
      array[i], array[hi] = array[hi], array[i]
      hi -= 1
    else
      i += 1
    end
  end

  i - 1
end

def quickselect(array, kth=1, &prc)
  prc ||= Proc.new { |a, b| b <=> a }
  kth -= 1
  kth = [0, kth].max
  kth = [array.length - 1, kth].min
  array.shuffle!
  lo = 0
  hi = array.length - 1
  while true
    i = partition(array, lo, hi, &prc)
    if i < kth
      lo = i + 1
    elsif i > kth
      hi = i - 1
    else
      break
    end
  end

  array.take(i + 1)
end

p quickselect([100,6,8,4,50,7,4,645,6,3,1,2,6,3], 5) { |a, b| b <=> a }
p quickselect([100,6,8,4,50,7,4,645,6,3,1,2,6,3], 5) { |a, b| b <=> a }.last

def qsort_3_way_partitioning(array, lo=0, hi=array.length-1, &prc)
  return if lo >= hi
  prc ||= Proc.new { |a, b| a <=> b }
  array.shuffle! if lo == 0 && hi == array.length - 1
  pivot = array[lo]
  lt = lo
  i = lo
  gt = hi

  until gt < i
    if prc.call(array[i], pivot) == -1
      array[lt], array[i] = array[i], array[lt]
      lt += 1
      i += 1
    elsif prc.call(array[i], pivot) == 1
      array[i], array[gt] = array[gt], array[i]
      gt -= 1
    else
      i += 1
    end
  end

  qsort_3_way_partitioning(array, lo, lt - 1, &prc)
  qsort_3_way_partitioning(array, gt + 1, hi, &prc)
  array
end

p qsort_3_way_partitioning([100,6,8,4,50,7,4,645,6,3,1,2,6,3])
p qsort_3_way_partitioning(['P', 'A', 'B', 'X', 'W', 'P', 'P', 'V', 'P', 'D', 'P', 'C', 'Y', 'Z']) { |a, b| b <=> a }
