def go(*args)
  puts args.inspect  # [1,2,3,4]
end


go(1, 2, 3, 4)

# double splat for keyword argumeents (hash)

def goh(*params)
  puts params.inspect
end

go(x:100, y:200)

