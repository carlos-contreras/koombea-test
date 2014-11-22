def echo(stuff)
	line = String.new
	stuff.each do |word|
		line << " #{word},"
	end
	puts line.chop.strip
end

dictionary = Hash.new
name_of_file = 'wl.txt'

File.readlines(name_of_file).each do |line|
	tmp = Array.new
	line.length.times do |i|
		tmp << line[i].downcase
	end
	key = tmp.sort.join.to_sym
	unless dictionary.has_key? (key)
		dictionary[key] = Array.new
	end
	dictionary[key] << line.chomp
end

count = 0

dictionary.each do |key, item|
	if item.length > 1
		echo(item)
		count += 1
	end
end

puts " -> There are #{count} anagrams within the input file"




