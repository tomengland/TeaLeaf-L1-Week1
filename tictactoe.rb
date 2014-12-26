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
  case
  when (board[1] == 'X' && board[2] == 'X' && board[3] == 'X') || (board[1] == 'O' && board[2] == 'O' && board[3] == 'O')
    if (board[1] == 'X' && board[2] == 'X' && board[3] == 'X')
      puts "You Won!"
    else
      puts "Computer Won!"
    end
    true
  when (board[1] == 'X' && board[5] == 'X' && board[9] == 'X') || (board[1] == 'O' && board[5] == 'O' && board[9] == 'O')
    if (board[1] == 'X' && board[5] == 'X' && board[9] == 'X')
      puts "You Won!"
    else
      puts "Computer Won!"
    end
    true
  when (board[1] == 'X' && board[4] == 'X' && board[7] == 'X') || (board[1] == 'O' && board[4] == 'O' && board[7] == 'O')
    if (board[1] == 'X' && board[4] == 'X' && board[7] == 'X')
      puts "You Won!"
    else
      puts "Computer Won!"
    end
    true
  when (board[2] == 'X' && board[5] == 'X' && board[8] == 'X') || (board[2] == 'O' && board[5] == 'O' && board[8] == 'O')
    if (board[2] == 'X' && board[5] == 'X' && board[8] == 'X')
      puts "You Won!"
    else
      puts "Computer Won!"
    end
    true
  when (board[3] == 'X' && board[6] == 'X' && board[9] == 'X') || (board[3] == 'O' && board[6] == 'O' && board[9] == 'O')
    if (board[3] == 'X' && board[6] == 'X' && board[9] == 'X')
      puts "You Won!"
    else
      puts "Computer Won!"
    end
    true
  when (board[3] == 'X' && board[5] == 'X' && board[7] == 'X') || (board[3] == 'O' && board[5] == 'O' && board[7] == 'O')
    if (board[3] == 'X' && board[5] == 'X' && board[7] == 'X')
      puts "You Won!"
    else
      puts "Computer Won!"
    end
    true
  when (board[4] == 'X' && board[5] == 'X' && board[6] == 'X') || (board[4] == 'O' && board[5] == 'O' && board[6] == 'O')
    if (board[4] == 'X' && board[5] == 'X' && board[6] == 'X')
      puts "You Won!"
    else
      puts "Computer Won!"
    end
    true
  when (board[7] == 'X' && board[8] == 'X' && board[9] == 'X') || (board[7] == 'O' && board[8] == 'O' && board[9] == 'O')
    if (board[7] == 'X' && board[8] == 'X' && board[9] == 'X')
      puts "You Won!"
    else
      puts "Computer Won!"
    end
    true
  end     
end

def ai_picks_square(board)
  # have ai pick a square
  board_with_empty_slots = board.select do |key, value|
    value == ' ' 
  end
  board_with_empty_slots.keys.sample
end

def all_squares_taken?(board)
  !board.has_value?(' ')
end

def play_again_check?
  begin
    puts "Play again? (Y/N)"
    answer = gets.chomp.downcase
  end until answer == 'y' || answer == 'n'
  if answer == 'y'
    true
  else 
    false
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
end while play_again_check?


puts "Thanks for playing"




