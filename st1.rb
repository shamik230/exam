file_path = "/data/1.txt"
current_path = File.dirname(__FILE__)
r_path = current_path + file_path
exit unless File.exist?(r_path)
file = File.new(r_path, "r")

string_a = file.read

def str_to_i(s)
    s[1..s.size - 1].to_i
end
pos = [0, 0, "N"]
array = string_a.delete(",").split(" ")
array.each do |i|
    if i[0] == "L"
        case pos[2]
            when "N"
                pos[2] = "W"
                pos[0] += -str_to_i(i)
            when "W"
                pos[2] = "S"
                pos[1] += str_to_i(i)
            when "S"
                pos[2] = "E"
                pos[0] += str_to_i(i)
            when "E"
                pos[2] = "N"
                pos[1] += -str_to_i(i)
        end
    end
    if i[0] == "R"
        case pos[2]
        when "N"
            pos[2] = "E"
            pos[0] += str_to_i(i)
        when "E"
            pos[2] = "S"
            pos[1] += str_to_i(i)
        when "S"
            pos[2] = "W"
            pos[0] += -str_to_i(i)
        when "W"
            pos[2] = "N"
            pos[1] += -str_to_i(i)
    end
    end
end
p pos

file.close