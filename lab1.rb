#coding: UTF-8
#!/usr/bin/ruby

puts Dir.pwd

in_, out_, key_, mod_ = ARGV

input_ = File.open(in_,"r")
output_ = File.new(out_,"w")
keyfile_ = File.open(key_,"r")

#def vig_alg(in_, key_, mod_)
  in_str = File.read(in_)
  #puts(in_str)
  
  key_str = File.read(key_)
  #puts(key_str)
  
  #puts "\n"
  x = in_str.length
  #puts(x)
  x = x - 1
  y = key_str.length
  #puts(y)
  y = y - 1
  #puts "\n"
  in_str.chars.to_a
  in_array = Array.new
  for i in (0..x)
    in_array[i] = in_str[i].ord
	puts in_array[i]
	end
  #puts "\n"
  key_str.chars.to_a
  key_array = Array.new
  for i in (0..y)
    key_array[i] = key_str[i].ord
	puts key_array[i]
	end
  #puts "\n"
  key_cycle = Array.new
  key_cycle = key_array.cycle.each
  c = Array.new
  res = Array.new
  for i in (0..x)
    c[i] = in_array[i]
	end
	case mod_
	when "c"
      for i in (0..x)
	    #puts key_cycle.next
        c[i] = (in_array[i] + key_cycle.next) % 256
        res[i] = c[i].chr
        end
	else
	  for i in (0..x)
	    #puts key_cycle.next
        c[i] = (in_array[i] - key_cycle.next + 256) % 256
        res[i] = c[i].chr
        end
	 end
	  #puts "\n"
	  #puts c
	  #puts res
	  res = res.join
  File.write(out_, res)
#end

input_.close
output_.close
keyfile_.close