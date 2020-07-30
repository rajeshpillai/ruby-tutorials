def myeach (arr)
  0.upto(arr.length - 1) do |x|
    yield arr[x] # if block_given?
  end
end

myeach [1,2,3] do |item|
  p item
end