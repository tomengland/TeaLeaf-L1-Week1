def say(msg)
  puts "----------- #{msg} ------------"
end
def operator()
  say "1) add 2) subtract 3) multiply 4) divide"
  gets.chomp 
end
def checkOperator(a_operator, num1, num2)
  if a_operator == '1'
   say "Numbers: #{num1} #{num2}.  You chose to #{a_operator}"
   num1.to_f.round(2) + num2.to_f.round(2)

  elsif a_operator == '2'
   say "Numbers: #{num1} #{num2}.  You chose to #{a_operator}"
   num1.to_f.round(2) - num2.to_f.round(2)

  elsif a_operator == '3'
   say "Numbers: #{num1} #{num2}.  You chose to #{a_operator}"
   num1.to_f.round(2) * num2.to_f.round(2)

  elsif a_operator == '4'
   say "Numbers: #{num1} #{num2}.  You chose to #{a_operator}"
   num1.to_f.round(2) / num2.to_f.round(2)
    
  else
   say "Please choose a correct operator"
   a = operator()
   checkOperator(a, num1, num2)
  end
end
# begin program

begin 
  say "What's the first number?"
  num1 = gets.chomp
end while num1.empty? || num1.to_i.zero?
begin
  say "What is the second number?"
  num2 = gets.chomp
end while num2.empty? || num1.to_i.zero?

a = operator()
result = checkOperator(a, num1, num2)

say "Result is #{result}"

