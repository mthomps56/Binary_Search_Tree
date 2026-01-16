class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other)
    node.data <=> other.node.data
  end
end

class Tree
  attr_accessor :root, :height

  def initialize(arr, idx_start, idx_end)
    @root = build_tree(arr, 0, arr.length - 1)
    @height = {left: 0, right: 0}
  end

  def build_tree(arr, idx_start, idx_end)
    return root if idx_end - idx_start < 1

    mid = idx_start + (idx_end - idx_start) / 2
    self.root = Node.new(arr[mid])

    self.root.left = build_tree(arr, idx_start, mid - 1)
    self.root.right = build_tree(arr, mid + 1, idx_end)

    return root
  end
  
  def insert(data)
    node = Node.new(data)
    node.data < root.data ? current_node = node.left: 
                            current_node = node.right
    if current_node.nil?
      current_node = node
    else
      insert(node)
    end
  end

#node = root, 
  def traversal(queue = [root], &block)

    block.call(queue) if block_given?
    queue.each_with_index do |node, index|
      queue << node.left unless node.left.nil? 
      queue << node.right unless node.right.nil?
    end 
  end
end
#    q_len = queue.length - 1
arr = Array.new(50) { rand(1..100) }
arr.sort!.uniq!
bst = Tree.new(arr, 0, arr.length - 1)
bst.traversal { |queue| puts queue[1].data } 


#  def tree_height(current = root, l_height = 0, r_height = 0)
#    return nil if root.nil? 
#    unless root.left.nil?
#      current = root
#      puts "left current: #{current}"
#      return l_height if current.nil?
#      l_height += 1
#      tree_height(current)
#    else
#      current = root.right
#      puts "right current #{current}"
#      return r_height if current.nil?
#      r_height += 1
#      tree_height(current)
#    end
#    l_height >= r_height ? (return l_height) : (return r_height)
#  end
    

