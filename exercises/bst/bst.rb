class Node
  attr_accessor :left
  attr_accessor :right
  attr_accessor :val

  def initialize(val)
    @val = val
  end
end

def create_tree(nums)
  # Include check that it's only integers
  return nil if nums.size == 0
  sorted_array_to_bst(nums, 0, nums.size - 1)
end

def sorted_array_to_bst(nums, first, last)
  return nil if first > last

  mid = (first + last) / 2
  root = Node.new(nums[mid])

  return root if first == last

  root.left = sorted_array_to_bst(nums, first, mid - 1)
  root.right = sorted_array_to_bst(nums, mid + 1, last)

  return root
end

class Solution
  def display_tree(root)
    queue = []
    
  end
end

print create_tree([])
print create_tree([1, 2, 4, 7, 9])
