puts 'Play Paper Rock Scissors!'
#Helper methods
def play
  begin
    puts 'Choose one: (P/R/S)'
    choice = gets.chomp.downcase
  end until choice == 'p' || choice == 'r' || choice == 's'
  if choice == 'p'
    choice = 0
  elsif choice == 'r'
    choice = 1
  elsif choice == 's'
    choice = 2
  end
  # generate a random number ranging from 0,1,2
  computer_choice_number = rand(3)
  return [choice, computer_choice_number]
end
def play_again_check()
  begin
    puts "Play again? (Y/N)"
    answer = gets.chomp.downcase
  end until answer == 'y' || answer == 'n'
  if answer == 'y'
    'y'
  elsif answer == 'n'
    puts "Thanks for playing!"
  end
end
#Loop of game
begin
  answers_array = play
  case answers_array
  when [0, 0]
    puts "You picked Paper and computer picked Paper"
    puts "It's a tie"
  when [1, 1]
    puts "You picked Rock and computer picked Rock"
    puts "It's a tie"
  when [2, 2]
    puts "You picked Scissors and computer picked Scissors"
    puts "It's a tie"
  when [0, 1]
    puts "You picked Paper and computer picked Rock"
    puts "You win!"
  when [0, 2]
    puts "You picked Paper and computer picked Scissors"
    puts "You lose!"
  when [1, 0]
    puts "You picked Rock and computer picked Paper"
    puts "You lose!"
  when [1, 2]
    puts "You picked Rock and computer picked Scissors"
    puts "You win!"
  when [2, 0]
    puts "You picked Scissors and computer picked Paper"
    puts "You win!"
  when [2, 1]
    puts "You picked Scissors and computer picked Rock"
    puts "You lose!"
  else 
    puts "A combination/possibility was not thought of, contact developer immediately!"
  end
end while play_again_check == 'y'




