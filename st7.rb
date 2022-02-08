file_path = "/data/7.txt"
current_path = File.dirname(__FILE__)
r_path = current_path + file_path
exit unless File.exist?(r_path)
file = File.new(r_path, "r")

string_a = file.read

arr = string_a.split("\n")

def outer(s)
    array = s.gsub(/\[[a-z]+\]/, "0").split("0")
    #p array
    array.each do |str|
        0.upto(str.size - 4) do |i|
            if ((str[i, 4] == str[i, 4].reverse) && (str[i] != str[i+1]))
                return true
            end
        end
    end
    return false
end

def in_scopes(s)
    array = s.scan(/\[[a-z]+\]/)
    #p array
    array.each do |str|
        0.upto(str.size - 4) do |i|
            if ((str[i, 4] == str[i, 4].reverse) && (str[i] != str[i+1]))
                return true
            end
        end
    end
    return false
end

sum = 0
arr.each do |i|
    if(outer(i) == true && in_scopes(i) == false)
        sum += 1
    end
end
p sum

file.close