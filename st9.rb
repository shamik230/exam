file_path = "/data/9.txt"
current_path = File.dirname(__FILE__)
r_path = current_path + file_path
exit unless File.exist?(r_path)
file = File.new(r_path, "r")

str = file.read

array = str.downcase.split("\n")
arr = []
array.each {|el| arr << el.gsub(/ to /, "#").split("#")}
arr.each do |el|
    el[1] = el[1].gsub(/ = /, "#").split("#")
    el.flatten!
end
list = "faerun norrath tristram alphacentauri arbre snowdin tambi straylight".split(" ")
matrix = Array.new(8) {Array.new(8)}
arr.each do |el|
    i = list.find_index(el[0])
    j = list.find_index(el[1])
    matrix[i][j] = (el[2].to_i)
    matrix[j][i] = (el[2].to_i)
end
8.times do |i|
    matrix[i][i] = 0
end
comb = (0..7).to_a
max = 0
iterator = 0
loop do
    sum = 0
    shuf = comb.shuffle
    i = shuf[0]
    j = shuf[1]
    sum = matrix[i][j]
    1.upto(6) do |i|
        k = shuf[i]
        l = shuf[i+1]
        sum += matrix[k][l]
    end
    max = sum if (max < sum)
    p "max: #{max} ##{iterator}"
    iterator += 1
end

file.close