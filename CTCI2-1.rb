Node = Struct.new(:value, :next_node, :unique_id) 

def list_generator(nodes, sample_arr)
	last_node = nil

	nodes.times do |n|
		if(sample_arr == true)
			curr_node = Node.new(n, last_node, n)
		else
			curr_node = Node.new(sample_arr.sample, last_node, n)
		end
		last_node = curr_node
	end
	return last_node
end

def pretty_print(head)
	if(!!head.next_node)
		print "#{head.value} => "
		# print "(val: #{head.value}, id: #{head.unique_id}) => "
		pretty_print(head.next_node) 
	else
		print "#{head.value}"

		# print "(val: #{head.value}, id: #{head.unique_id})"
		# p ""
	end
end


def dupe_remover(head)
	value = head.value
	curr_node = head.next_node
	prev_node = head
	while curr_node != nil
		if(curr_node.value == value)
			del_node(prev_node, curr_node)
		else
			prev_node = curr_node
		end
		
		curr_node = curr_node.next_node
	end
	if(head.next_node)
		dupe_remover(head.next_node)
	end
	head
end

def del_node(prev, curr)
	prev.next_node = nil
	prev.next_node = curr.next_node 
end
puts "================"
dupeList = list_generator(40, [1,2,3])
puts ""
puts "data"
pretty_print(dupeList)
puts ""
puts "solution"
pretty_print(dupe_remover(dupeList))
puts ""

def kth_element(head, k)
	#starting at 0 from the end
	queue = []
	curr = head
	while curr != nil
		queue.unshift(curr)
		curr = curr.next_node
	end

	final = 0
	(k + 1).times do |i|
		final = queue.shift
	end
	final
end
puts " "
p "==========="
puts " "
dupeList = list_generator(40, [3])
pretty_print(kth_element(dupeList, 3))

def delete_mid(head)
	curr = head
	while curr.next_node

		curr.value = curr.next_node.value
		prev = curr
		curr = curr.next_node
	end
	prev.next_node = nil
end
puts " "
p "============="
puts " "
dupeList = list_generator(40, true)
delete_mid(dupeList.next_node.next_node)
pretty_print(dupeList)


def sort_thingy(head, mid)
	#put all numbers less than your split
	#to the right of your split
	curr = head.next_node
	prev = head
	while curr != nil
		next_node = curr.next_node
		if(next_node != nil)
			p(next_node.unique_id)
		end
		if(curr.value < mid)
			curr.next_node = head
			head = curr
			prev.next_node = next_node
		else
			prev = curr
		end
		curr = next_node
	end
	head
end
puts " "
p "============="
puts " "
dupeList = list_generator(40, Array(1..20))
pretty_print(dupeList)
puts " "
puts " "
pretty_print(sort_thingy(dupeList, 7))

def sum_lists(l1, l2)
	int1 = linked_to_i(l1, 0) 
	int2 = linked_to_i(l2, 0)
	i_to_l(int1 + int2) 
end

def linked_to_i(li, acc)
	acc = acc + li.value
	return acc unless(li.next_node)
	linked_to_i(li.next_node, acc)
end