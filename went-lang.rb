class Parser
 def self.Sum(arr)
	 sum = 0
	 for i in arr
	   sum += i.to_i
	 end
	puts sum
 end
 def self.Minus(arr)
	arr.shift
        sum = arr.shift.to_i
        for i in arr
          sum -= i.to_i
        end
      puts sum
 end
 def self.Cross(arr)
	sum = 1
	arr.delete_if {|c| c == "*" }
	for i in arr
	 sum *= i.to_f
	end
	puts sum
 end
 def self.Divide(arr)
	arr.delete_if {|c| c == "/"}
	sum = arr.shift.to_f
	for i in arr
	 sum /= i.to_f
	end
	puts sum
 end	
 def self.Power(arr)
	arr.delete_if {|c| c == "^"}
	sum = arr.shift.to_f
	for i in arr
	 sum **= i.to_f
	end
	puts sum
 end
 def self.FloatingPoint(arr)
	arr.delete_if {|c| c == "%"}
	sum = arr.shift.to_f
	for i in arr
	 sum %= i.to_f
	end
	puts sum
 end

end

class Lexer
     def self.Lexer(cmd)
	if cmd.split(' ').include?"+"
	 Parser.Sum(cmd.split(' '))
	elsif cmd.split(' ').include?"-"
	 Parser.Minus(cmd.split(' '))
	elsif cmd.split(' ').include?"*"
	 Parser.Cross(cmd.split(' '))
	elsif cmd.split(' ').include?"/"
	 Parser.Divide(cmd.split(' '))
	elsif cmd.split(' ').include?"^"
	 Parser.Power(cmd.split(' '))
	elsif cmd.split(' ').include?"%"
	 Parser.FloatingPoint(cmd.split(' '))
	else
	 puts " #{cmd} is not a WENT command"
	end
     end
end

class REPL
 def self.REPL()
   n = 0
     while true
	print "WENT [#{n}] - > "
	cmd = gets.chomp
	Lexer.Lexer(cmd)
	n += 1
     end
 end
end


REPL.REPL()
