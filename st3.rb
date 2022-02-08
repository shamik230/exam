file_path = "/data/3.txt"
current_path = File.dirname(__FILE__)
r_path = current_path + file_path
exit unless File.exist?(r_path)
file = File.new(r_path, "r")

str = file.read

sum = 0
array_of_str = str.split("\n")
array_of_str.each_with_index do |i, ind_i|
    array_of_str[ind_i] = i.split(" ")
end

array_of_str.each_with_index do |i, ind_i|
    i.each_with_index do |j, ind_j|
        i[ind_j] = j.to_i
    end
end

array_of_str.each do |i|
    if(i[0] + i[1] > i[2] && i[1] + i[2] > i[0] && i[0] + i[2] > i[1])
        sum += 1
    end
end
p sum

file.close