#4.8

#gonna assume nodes include their parents
Struct.new("tree_node", :left, :parent, :right, :value)
def first_common_ancestor(node1, node2)
	depthNode1 = depth(node1)
	depthNode2 = depth(node2)

	pointer1 = node1
	pointer2 = node2

	diff = abs(depthNode2 - depthNode1)
	if(depthNode2 > depthNode1)
		diff.times do
			pointer2 = pointer2.parent
		end
	elsif(depthNode1 > depthNode2)
		diff.times do
			pointer1 = pointer1.parent
		end
	end
		

	while(pointer1 != pointer2 || pointer1.parent != nil)
		pointer1 = pointer1.parent
		pointer2 = pointer2.parent
	end

	return pointer1 unless pointer1 != pointer2
	return false
end

def depth(node)
	dep = 0
	while(node != nil)
		node = node.parent
		dep += 1
	end
	return dep
end


#4.9
#gonna assume arrays can't have duplicate values

def sequence_hunter(head)
	arr_arrs = []
	
	arr_values = []
	arr_values.push(node.value)

	#nope, giving up after an hour
	#basically we need to generate an array of each level
	#but good fucking luck
end

#4.10

def find_subtree(big_head, small_head)
	#traverse the big tree, if we see small head, traverse both trees and see if they're the same

	stack = [big_head]

	while(curr != small_head && curr != nil)
		curr = stack.pop
		stack.push(curr.right)
		stack.push(curr.left)
	end

	if(curr == nil)
		return "no subtree"
	end

	same_tree(curr, small_head)
end

def same_tree(left, right)
	left_stack = [left]
	right_stack = [right]
	while(!left_stack.empty? || !right_stack.empty?)
		curr_left = left_stack.pop
		curr_right = right_stack.pop

		left_stack.push(curr_left.right)
		left_stack.push(curr_left.left)
		right_stack.push(curr_right.right)
		right_stack.push(curr_right.left)
		if(curr_left != curr_right)
			return false
		end
	end	

	return true
end

#4.11
#gonna assume i have a sane tree implementation i'm bootstrapping on to
#the only change is that whenever we insert a node, we update the number of subnodes on all parent nodes
#and when we delete a node, we update the number of subnodes on all parent nodes
Struct.new("tree_node", :left, :parent, :right, :value, :number_of_subnodes)

def select_random(head)
	stack = [head]
	while(!stack.empty?)
		curr = stack.pop
		rand_val = Random.new(0..curr.number_of_subnodes)
		if(rand_val == 1)
			return curr
		end
		stack.push(curr.right)
		stack.push(curr.left)
	end

	return curr
end

#4.12

def get_path_sum(head, target)
	return 0 if(head == nil)

	paths_from_here = get_paths_from_node(head, target, 0)

	left_path = get_path_sum(head.left_node, target)
	right_path =get_path_sum(head.right_node, target)
	return left_path + right_path + paths_from_here
end


def get_paths_from_node(head, target, accum_sum)
	return 0 if(head == nil)
	accum_sum += node.data

	total_paths = 0
	if(accum_sum == target)
		total_paths += 1
	end

	total_paths += get_paths_from_node(head.left_node, target, accum_sum)
	total_paths += get_paths_from_node(head.right_node, target, accum_sum)

	return total_paths
end

