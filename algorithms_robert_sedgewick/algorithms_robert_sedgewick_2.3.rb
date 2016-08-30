def qsort_3_way_partitioning(array, lo=0, hi=array.length-1)
  return if lo >= hi
  array.shuffle! if lo == 0 && hi == array.length - 1
  pivot = array[lo]
  lt = lo
  i = lo
  gt = hi

  until gt < i
    if array[i] < pivot
      array[lt], array[i] = array[i], array[lt]
      lt += 1
      i += 1
    elsif array[i] > pivot
      array[i], array[gt] = array[gt], array[i]
      gt -= 1
    else
      i += 1
    end
  end

  qsort_3_way_partitioning(array, lo, lt - 1)
  qsort_3_way_partitioning(array, gt + 1, hi)
  array
end

p qsort_3_way_partitioning([100,6,8,4,50,7,4,645,6,3,1,2,6,3])
