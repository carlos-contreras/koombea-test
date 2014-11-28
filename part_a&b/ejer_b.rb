dictionary = {}
name_of_file = 'wl.txt'

File.readlines(name_of_file).each do |line|
	tmp = []
	line.each_char do |c|
		tmp << c.downcase
	end
	key = tmp.sort.join.to_sym
	dictionary[key] ||= []
	dictionary[key] << line.chomp
end

ananagrams = dictionary.select do |key, value|
	if value.length == 1
		puts value[0]
		true
	end
end

puts " -> There are #{ananagrams.size} ananagrams within the input file"