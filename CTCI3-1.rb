#we're skipping one because its trivial in ruby

#2

class MyStack
	def initialize
		@stack = []
		@sortedValues = []
		@min = []
	end

	def push(val)
		@stack.push(val)
		@min.push(val)
		@min.sort!
	end

	def pop
		ret_val = @stack.pop
		@min = @stack.dup
		@min.sort!
		ret_val
	end

	def min
		return @min[0]
	end
end

stack = MyStack.new()

stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
p "-----------------"
p stack.min == 1

p stack.pop == 4

p stack.min == 1

stack.push(-1000)

p stack.min == -1000
p "--------------------"

class ManyStack
	def initialize
		@stacks = [[]]
		@curr_ind = 0
		@max_size = 4
	end

	def push(value)
		if(@stacks[@curr_ind].length == @max_size)
			create_new(value)
		else
			@stacks[@curr_ind].push(value)
		end
	end

	def create_new(value)
		@curr_ind += 1
		@stacks[@curr_ind] = [value]
	end


	def pop
		if(@stacks[@curr_ind].length == 1)
			ret_val = @stacks[@curr_ind].pop
			@stacks[@curr_ind] = nil
			@curr_ind -= 1
			if(@curr_ind == -1)
				@curr_ind = 0
			end
		else
			@stacks[@curr_ind].pop
		end
		return ret_val
	end

	def popAt(ind)
		stack = @stacks[ind]
		if stack.nil?
			return nil
		else
			ret_val = stack.pop
		end
		if(stack.empty?)
			@stacks.delete_at(ind)
			@curr_ind -= 1
		end
		ret_val
	end
end



class MyQueue
	def initialize
		@inbox = []
		@outbox = []
	end

	def shift
		if(@outbox.empty?)
			while !@inbox.empty?
				@outbox.push(@inbox.pop)
			end
		end
		@outbox.pop
	end

	def unshift(val)
		@inbox.push(val)
	end
end

queue = MyQueue.new

queue.unshift(1)
queue.unshift(2)
queue.unshift(3)
queue.unshift(4)
queue.unshift(5)
p queue.shift == 1
p queue.shift == 2
p queue.shift == 3
queue.unshift(5)
queue.unshift(6)
p queue.shift == 4


class SortedStack
	def initialize
		@sorted = []
	end

	def empty?
		@sorted.empty?
	end

	def sort_stack
		temp_stack = []
		while !@sorted.empty?
			temp = @sorted.pop

			while(!temp_stack.empty? && temp_stack.peek() > temp)
				@sorted.push(temp_stack.pop());
			end
			temp_stack.push(temp);
		end
		@sorted = temp_stack
	end

	def pop
		@sorted.pop
	end

	def push
		@sorted.push(val)
		sort_stack
	end
end


class CatsAndDogs
	def initialize
		@all_animals = []
		@cat_queue = []
		@dog_queue = []
	end

	def enqueueDog(dog)
		@dog_queue.unshift(dog)
		@all_animals.unshift(dog)
	end
	def enqueueCat(cat)
		@cat_queue.unshift(cat)
		@all_animals.unshift(cat)
	end

	def dequeueCat
		cat = @cat_queue.shift
		temp_buffer = []
		while (@all_animals.peek != cat)
			temp_buffer.push(@all_animals.shift)
		end
		ret_val = @all_animals.shift

		while(!temp_buffer.empty?)
			@all_animals.push(temp_buffer.pop)
		end
		ret_val
	end
	def dequeueDog
		dog = @dog_queue.shift
		temp_buffer = []
		while (@all_animals.peek != dog)
			temp_buffer.push(@all_animals.shift)
		end
		ret_val = @all_animals.shift

		while(!temp_buffer.empty?)
			@all_animals.push(temp_buffer.pop)
		end
		ret_val
	end

	def dequeueAny
		any = @all_animals.shift
		if(@cat_queue.peek == any)
			@cat_queue.shift
		else
			@dog_queue.shift
		end
		any
	end
end


