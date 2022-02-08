file_path = "/data/6.txt"
current_path = File.dirname(__FILE__)
r_path = current_path + file_path
exit unless File.exist?(r_path)
file = File.new(r_path, "r")

str = file.read

arr1 = str.split("\n")
#arr = ["ykaxtdkjqevtttbx"]
def check1(str)
    array = []
    0.upto(str.size - 2) do |i|
        array << str[i, 2]
    end
    sub = array[0] 
    #p array
    1.upto(array.size) do |i|
        if (sub == array[i])
            sub = array[i]
            array.delete_at(i)
        end
        sub = array[i]
    end
    #p array
    if array.size != array.uniq.size
        return true
    else
        return false
    end
end

def check2(str)
    0.upto(str.size - 3) do |i|
        return true if str[i, 3] == str[i, 3].reverse
    end
    return false
end

sum = 0
arr1.each do |i|
    if (check1(i) == true && check2(i) == true)
        #p i
        sum += 1
    end
end
p sum

file.close