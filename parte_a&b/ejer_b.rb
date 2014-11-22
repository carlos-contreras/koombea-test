dictionary = Hash.new
name_of_file = 'wl1.txt'

File.readlines(name_of_file).each do |line|
	tmp = Array.new
	line.length.times do |i|
		tmp << line[i].downcase
	end
	key = tmp.sort.join.to_sym
	unless dictionary.has_key?(key)
		dictionary[key] = Array.new
	end
	dictionary[key] << line.chomp
end

count = 0

dictionary.each do |key, item|
	if item.length == 1
		puts item
		count += 1
	end
end

puts " -> There are #{count} ananagrams within the input file"