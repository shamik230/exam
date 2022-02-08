file_path = "/data/2.txt"
current_path = File.dirname(__FILE__)
r_path = current_path + file_path
exit unless File.exist?(r_path)
file = File.new(r_path, "r")

str = file.read

array_of_str = str.split("\n")
array_of_str.each_with_index do |i, ind_i|
    array_of_str[ind_i] = i.split("\t")
end

array_of_str.each_with_index do |i, ind_i|
    i.each_with_index do |j, ind_j|
        i[ind_j] = j.to_i
    end
end
sum = []
array_of_str.each do |i|
    sum << (i.max - i.min).abs
end
p "sum: #{sum.sum}"

file.close