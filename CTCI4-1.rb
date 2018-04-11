Struct.new("graph_node", :children, :visited, :value)
Struct.new("tree_node", :left, :right, :value)
module BinaryTree
  BNode = Struct.new(:node, :left_tree, :right_tree) do

  end

  def create_tree array
    return nil if array.nil? || array.empty?
    if array.size == 1
      return BNode.new(array[0], nil, nil)
    elsif array.size == 2
      return BNode.new(array[1], BNode.new(array[0]), nil)
    elsif array.size == 3
      return BNode.new(array[1], BNode.new(array[0]),BNode.new(array[2]))
    else
      split = array.size / 2
      left_tree = array.take(split) 
      right_tree = array.drop(split + 1)
      return BNode.new(array[split], create_tree(left_tree), create_tree(right_tree))
    end
  end

end

#4.1
def graph_routes(start_node, destination)
	queue = []
	queue.unshift(start_node)
	while !queue.empty?
		curr = queue.shift
		if curr.visited
			next
		end
		if(curr == destination)
			return true
		end
		queue.children.each do |child|
			queue.unshift(child)
		end
		curr.visited == true
	end
	return false
end

#4.2
def create_bst(arr, start, fin)
	if(start > fin)
		return nil
	end
	mid = (start+fin) / 2
	root = tree_node.new(value: arr[mid], left: nil, right: nil)
	root.left(create_bst(arr, start, mid - 1))
	root.right(create_bst(arr, mid + 1, fin))

	return root
end

#4.3
def create_linked_lists(root)
	#cry, cry deeply
	h = height(root)
    arr = []
end




def height(node)
	if(node == nil)
		return 0
	else
		left_height = height(node.left)
		right_height = height(node.right)
	end

	if left_height > right_height 
        return left_height+1
    else
        return right_height+1
    end
end

#4.4

def is_balanced(head)
	#recursively check the longest path down the left and right
	if (head == nil)
        return true;
    end

    left_height = get_height(head.left)
    right_height = get_height(head.right)
    if(left_height - right_height <=  1 && is_balanced(head.left) && is_balanced(head.right))
    	return true
    end
    return false
  

end

def get_height(head)
	if(head == nil)
		return 0
	end
	return 1 + [height(head.left), height(head.right)].max
end
#4.5

def is_bst(head)
	if(head == nil)
		return true
	end

	if (head.left != nil && head.left.data > head.data) 
    	return false
	end


	if (head.right != nil && head.right.data > head.data) 
    	return false
	end

	if (!is_bst(head.left) || !is_bst(head.right)) 
   		return false
	end
     
	return true
end

#4.6

 def inOrderSuccessor(root, n) 
 
        if (n.right != nil) 
            return minValue(n.right);
        end
 
        parent = n.parent;
        while (parent != nil && n == parent.right) 
            n = parent;
            parent = parent.parent;
        end
        return parent;
end

 def minValue(node) 
    current = node;

    while (current.left != nil) 
        current = current.left;
    end
    return current;
 end
