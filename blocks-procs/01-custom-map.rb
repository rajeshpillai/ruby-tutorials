def my_map(enumerable, &block)
  result = []
  enumerable.each { |element| result << block.call(element) }
  result
end

p my_map(["foo", "bar"], &:upcase)  # ["FOO", "BAR"]