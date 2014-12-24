#1 Come up with specifications/requirements. it'll determine the scope. 
#2. Application Logic. 
#3. Translation of those steps into code.
#4. run code to verify logic. 
#loop
#steps
#1. draw board
# begin...
#2. player 1 picks empty square - method
# check for win - method
#3. AI picks empty square. - method
# check for win - 
#4. end while there_are_empty_spaces.
#5 show winner if there is a winner, ask do you want to play again
#6 else no winner it's tie, ask do you want to play again. 
#loop until they do not want to play again. 

def draw_board(board)
  system "clear" or system "cls"
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "---+---+---"
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "---+---+---"
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
end

def player_picks_square(board)
  begin
    puts 'Pick a square (1 - 9):'
    position = gets.chomp
  end until board[position.to_i] != 'X' && board[position.to_i] != 'O' && board.has_key?(position.to_i)
  position.to_i
end

def is_there_a_winner?(board)
  # check if there is a winner
  # 1 2 3
  # 4 5 6
  # 7 8 9 
  # winning combos
  # 123
  # 159
  # 147
  # 258
  # 369
  # 357
  # 456
  # 789

end

def ai_picks_square(board)
  # have ai pick a square
  board_with_empty_slots = board.select do |key, value|
    value == ' ' 
  end
  board_with_empty_slots.keys.sample
end

def all_squares_taken?(board)
  #all squares taken?
  !board.has_value?(' ')
end

def play_again_check?
  begin
    puts "Play again? (Y/N)"
    answer = gets.chomp.downcase
  end until answer == 'y' || answer == 'n'
  if answer == 'y'
    false
  else 
    true
  end
end
## GAME LOGIC BEGIN
begin
 board = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
  begin
    draw_board(board)
    board[player_picks_square(board)] = 'X'
    draw_board(board)
    break if is_there_a_winner?(board) || all_squares_taken?(board)
    board[ai_picks_square(board)] = 'O'
    draw_board(board)
  end until is_there_a_winner?(board) || all_squares_taken?(board)
end until play_again_check?


puts "Thanks for playing"




