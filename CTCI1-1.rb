def unique_chars(str)
	char_hash = {}
	str_arr = str.split("")
	str_arr.each do |char|
		if(char_hash[char])
			return false
		else
			char_hash[char] = 1
		end
	end
	return true
end
p "unique_chars"
p unique_chars("this")
p unique_chars("that")

def unique_chars_arr_only(str)
	pseudo_hash = []
	str_arr = str.split("")
	str_arr.each do |char|
		char_ord = char.ord
		if(pseudo_hash[char_ord] == 1)
			return false
		else
			pseudo_hash[char_ord] = 1
		end
	end
	return true
end
p "unique_chars_arr_only"
p unique_chars_arr_only("this")
p unique_chars_arr_only("that")

def permutation_finder(str1, str2)
	s_str1 = str1.chars.sort.join
	s_str2 = str2.chars.sort.join
	s_str1 == s_str2
end
p"permutation_finder"

p permutation_finder("thisstr", "rtssiht")
p permutation_finder("potato", "unicorn")

def urlify(str)
	str.strip.split(" ").join("%20")
end
p "urlify"
p urlify("this is a normal  string   ")

def palindrome_permuter(str)
	str_arr = str.split(" ").join("").split("")
	count_hash = {}
	str_arr.each do |char|
		if(count_hash[char])
			count_hash[char] += 1
		else
			count_hash[char] = 1
		end
	end

	seen_odd = false
	count_hash.each do |key, value|
		if(value % 2 == 1 && !seen_odd)
			seen_odd = true
		elsif(value % 2 == 1 && seen_odd)
			return false
		end
	end
	return true
end
p "palindrome_permuter"
p palindrome_permuter("add dda")
p palindrome_permuter("atco cta")
p palindrome_permuter("red")

def char_counter(str)
	str_arr = str.split(" ").join("").split("")
	count_hash = {}
	str_arr.each do |char|
		if(count_hash[char])
			count_hash[char] += 1
		else
			count_hash[char] = 1
		end
	end
	count_hash
end

def one_away(str1, str2)
	str1_chars = char_counter(str1)
	str2_chars = char_counter(str2)
	seen_diff = false
	str1_chars.each do |key, value|
		if(value != str2_chars[key] && !seen_diff)
			seen_diff = true
		elsif(value != str2_chars[key] && seen_diff)
			return one_replacement(str1, str2)
		end
	end
	return true
end

def one_replacement(str1, str2)
	str_arr1 = str1.split(" ").join("").split("")
	str_arr2 = str2.split(" ").join("").split("")
	difference = false
	str_arr1.each_with_index do |char, ind|
		if(char != str_arr2[ind] && !difference )
			difference = true
		elsif(char != str_arr2[ind] && difference )
			return false
		end
	end
	return true
end
p "one replacement"
p one_away("pale", "ple")
p one_away("pales", "pale")
p one_away("pale", "bale")
p one_away("pale", "bake")

def string_compressor(str)
	str_arr = str.split("")
	gen_str = ""
	count = 0
	curr_char = false
	str_arr.each do |char|
		curr_char = char unless(curr_char)
		if(char == curr_char)
			count += 1
		else
			gen_str += "#{curr_char}#{count}"
			count = 1
			curr_char = char
		end

	end
	gen_str += "#{curr_char}#{count}"

	if(gen_str > str)
		return str
	end
	gen_str
end

p "string_compressor"
p string_compressor("aabcccccaaa")
p string_compressor("ab")

#wtf 

def rotate_matrix(matrix)
	return "???"
end
p "rotate matrix"
p rotate_matrix([[1,2,3,4],[2,3,4,5],[3,5,6,7],[8,2,3,4]])
p rotate_matrix([[1,2,3,4],[2,3,4,5],[3,5,6,7],[8,2,3,4]])

def zero_matrix(matrix)
	new_matrix = Marshal.load( Marshal.dump(matrix) )
	to_zero_col = []
	matrix.each_with_index do |row, ind1|
		row.each_with_index do |char, ind2|
			if(char == 0)
				new_matrix[ind1] = Array.new(row.length, 0)
				to_zero_col.push(ind2)
			end
		end
	end
	p to_zero_col
	new_matrix.each do |row|
		to_zero_col.each do |ind|
			row[ind] = 0
		end
	end

	return new_matrix
end

p "zero_matrix"
p zero_matrix ([[1,2],[3,4]])
p zero_matrix ([[1,2,0],[3,4,5]])
p zero_matrix([[1,2,3],[4,0,6],[7,8,9]])

def zero_matrix_in_place(matrix)
	to_zero_col = []
	to_zero_row = []
	leng = matrix[0].length
	matrix.each_with_index do |row, ind1|
		row.each_with_index do |char, ind2|
			if(char == 0)
				to_zero_row.push(ind1)
				to_zero_col.push(ind2)
			end
		end
	end
	p to_zero_col
	to_zero_row.each do |ind|
		matrix[ind] =  Array.new(leng, 0)
	end

	matrix.each do |row|
		to_zero_col.each do |ind|
			row[ind] = 0
		end
	end

	return matrix

end
p "zero_matrix_in_place"
p zero_matrix_in_place ([[1,2],[3,4]])
p zero_matrix_in_place ([[1,2,0],[3,4,5]])
p zero_matrix_in_place ([[1,2,3],[4,0,6],[7,8,9]])

def is_rotation?(str1, str2)
	main_str = str1 + str1 + str1
	if main_str.include? str2
		return true
	end
	false
end

p "is substring"
p is_rotation?("waterbottle", "erbottlewat")
p is_rotation?("car", "moo")