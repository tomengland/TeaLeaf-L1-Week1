# blackjack
##---features - 1.0
  # 2 decks
  # hit, stay, push
##---features - 1.4 (Jan)
  # shuffle when shoe is below 2 Decks.
  # 6 decks.
  # ability to see running count to practice (Hi-Lo)
##---features - 1.5 (Feb)
  # ability to bet.
##---features - 1.6 (March)
  # add double down.
##---features - 1.7 (april)
  # add surrender 
def remove_cards_from_decks(hand, decks, initial_deal)
  if initial_deal == true
    hand.each do |card|
      decks[card].pop
    end
  else 
    decks[hand.last].pop
  end
decks.reject! {|k, v| v == []}
end

def total(hand, points)
  total = 0
  hand.each do |card|
    total += points[card]
  end
  total
end

def display_hands(hand)
  string = "  "
  hand.each do |card|
    string += "#{card}, "
  end
  string
end

def draw_game_board(name, player_hand, computer_hand, player_points, computer_points, decks, hide_dealer_card)
  system "clear" or system "cls"
  puts "       DEALER         "
  puts "----------------------"
  if hide_dealer_card
    puts "|                    |" 
    puts "  #{computer_hand[0]}   and   HIDDEN "
  else 
    puts "|                    | Computer Total: [#{total(computer_hand, computer_points)}]" 
    puts display_hands(computer_hand)
  end
  puts "|                    |"
  puts "----------------------"
  puts "----------------------"
  puts "|                    | #{name} Total: [#{total(player_hand, player_points)}]"
  puts display_hands(player_hand)
  puts "|                    |"
  puts "----------------------"
  puts "       #{name}        "
end

def check_for_outcomes(name, player_total, computer_total)
  if player_total > 21
    puts "You bust, sorry #{name}, you lose!"
  elsif computer_total > 21
    puts "#{name} wins, Dealer busted!"
  elsif computer_total > player_total
    puts "Dealer wins, dealer had more points than #{name}"
  elsif computer_total == player_total
    puts "Push, dealer and #{name} have the same amount of points."
  else 
    puts "#{name} wins, you had more points than dealer!"
  end
end

def check_for_ace(hand, points)
  if hand.include?("ACE")
    puts "Moving ACE from 10 to 1"
    points["ACE"] = 1
  end
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

begin
  puts "What is your name?"
  name = gets.chomp.capitalize
end while name.empty?

begin
  decks = { "ACE" => [], "2" => [], "3" => [], "4" => [], "5" => [], "6" => [], "7" => [], "8" => [], "9" => [], "JACK" => [], "QUEEN" => [], "KING" => [] }
  decks.each_key do |k|
    deck_cards = []
    if k == "ACE" || k == "JACK" || k == "QUEEN" || k == "KING"
      8.times do
        deck_cards << 10
      end
    else 
      8.times do
        deck_cards << k.to_i
      end
    end
    decks[k] = deck_cards
  end
  player_points = { "ACE" => 10, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "JACK" => 10, "QUEEN" => 10, "KING" => 10 }
  computer_points = { "ACE" => 10, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "JACK" => 10, "QUEEN" => 10, "KING" => 10 }
  player_hand = []
  computer_hand = []
  player_hand = decks.keys.sample 2
  remove_cards_from_decks(player_hand, decks, true)
  computer_hand = decks.keys.sample 2
  remove_cards_from_decks(computer_hand, decks, true)
  draw_game_board(name, player_hand, computer_hand, player_points, computer_points, decks, true)
  begin
    begin
      puts "Hit (H) or Stay (S)"
      player_response = gets.chomp.upcase!
    end until player_response == "H" || player_response == "S"
    if player_response == "H" 
      puts "---#{name} hits---"
      player_hand.push(decks.keys.sample)
      remove_cards_from_decks(player_hand, decks, false)
      draw_game_board(name, player_hand, computer_hand, player_points, computer_points, decks, true)
      if total(player_hand, player_points) > 21
        check_for_ace(player_hand, player_points) 
        draw_game_board(name, player_hand, computer_hand, player_points, computer_points, decks, true)
      end
      break if total(player_hand, player_points) > 21
    else 
      puts "---#{name} stands---"
    end
  end until player_response == "S"
  if total(player_hand, player_points) <= 21
    draw_game_board(name, player_hand, computer_hand, player_points, computer_points, decks, false)
    while total(computer_hand, computer_points) < 17
      puts "---Dealer hits---"
      computer_hand.push(decks.keys.sample)
      remove_cards_from_decks(computer_hand, decks, false)
      draw_game_board(name, player_hand, computer_hand, player_points, computer_points, decks, false)
      if total(computer_hand, computer_points) > 21
        check_for_ace(computer_hand, computer_points) 
        draw_game_board(name, player_hand, computer_hand, player_points, computer_points, decks, false)
      end
    end
  end
  if total(computer_hand, computer_points) >= 17 && total(computer_hand, computer_points) <= 21
    puts "---Dealer stands---"
    check_for_outcomes(name, total(player_hand, player_points), total(computer_hand, computer_points))
  else
    check_for_outcomes(name, total(player_hand, player_points), total(computer_hand, computer_points))
  end    
end while play_again_check?




