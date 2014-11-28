def echo(stuff)
	line = ""
	stuff.each do |w|
		line << " #{w},"
	end
	puts line.chop
end

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

anagrams = dictionary.select do |key, value|
	if value.length > 1
		echo(value)
		true
	end
end

puts " -> There are #{anagrams.size} anagrams within the input file"