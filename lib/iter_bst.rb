class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class Tree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def build_tree(arr, arr_end, arr_start = 0)
    mid = arr.length - 1 - 

