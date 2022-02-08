require 'digest'

string = "fkylfhsq"
password = ""
iter = 0
loop do
    a = Digest::MD5.hexdigest("#{string}#{iter.to_s}")
    if a[0, 5] == "00000"
        p a
        p a[5]
        password << a[5]
    end
    break if password.size == 8
    iter += 1
end
p password