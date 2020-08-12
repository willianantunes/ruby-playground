names = %w(David Yukihiro Chad Amy)
p names.map { |name| name.upcase } # ["DAVID", "YUKIHIRO", "CHAD", "AMY"]
# symbol-argument blocks... The same as above!
p names.map &:upcase # ["DAVID", "YUKIHIRO", "CHAD", "AMY"]

array = [1, 2, 3, 4, 5]
result = array.map { |n| puts n * 100 }
# Why? Because the return value of puts is always nil
p result # [nil, nil, nil, nil, nil]

names = %w(David Yukihiro Chad Amy)
names.map!(&:upcase)
p names # ["DAVID", "YUKIHIRO", "CHAD", "AMY"]

