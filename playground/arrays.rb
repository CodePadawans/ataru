list = [
  [1,2,3,[[[[[[[[4]]]]]]]]],
  [5,6,7],
  3,
  4,
  [12, [3,4]]
]


def again(n)
  n.map do |n|
    if !n.is_a?(Array)
      n*2
    else
      again(n)
    end
  end
end

def again_flat(n)
  output = []
  n.each do |n|
    if !n.is_a?(Array)
      output << n*2
    else
      output += again_flat(n)
    end
  end
  output
end


puts again(list).inspect
# [ [2,4,6,[[[[[[[[8]]]]]]]]], [10,12,14], 6, 8, [24, [6,8]] ]

puts again_flat(list).inspect
# [2,4,6,8,10,12,14,6,8,24,6,8]

