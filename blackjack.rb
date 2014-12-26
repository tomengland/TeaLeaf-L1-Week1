# blackjack
##---features - 1.0
  # 1 deck
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

##---Psuedo Code 1.0
# ask for name
# deal 2 cards to player, this should also subtract from available cards. (1 deck). 
# deal 2 cards to dealer, showing one card.
# repeat hit/stay?
# hit: add count to player_count.
# if count > 21 puts you bust you lose, break. 
# break if stay
# dealer hit while count < 17
# if computer_count > 21, puts dealer bust, you win, break
# show all cards, 
# if computer_count > player_count 
#   you lose
# elsif computer_count == player_count
#   push
# else
#   you win. 
# end
# play_again? y/n. 
require 'pry'

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
def total(who, player_hand, computer_hand, points)
  if who == "player"
    player_total = 0
    player_hand.each do |card|
      player_total += points[card]
    end
    player_total
  else
    computer_total = 0
    computer_hand.each do |card|
      computer_total += points[card]
    end
    computer_total
  end
end
def display_hands(who, hand)
  if who == "player"
    string = "  "
    hand.each do |card|
      string += "#{card}, "
    end
    string
  else
    string = "  "
    hand.each do |card|
      string += "#{card}, "
    end
    string
  end
end
#fix #2, refactor display of cards. 
def draw_game_board(name, player_hand, computer_hand, decks, hide_dealer_card)
  system "clear" or system "cls"
  puts "       DEALER         "
  puts "----------------------"
  if hide_dealer_card
    puts "|                    |" 
    puts "  #{computer_hand[0]}   and   HIDDEN "
  else 
    puts "|                    | Computer Total: [#{total("computer", player_hand, computer_hand, POINTS)}]" 
    puts display_hands("", computer_hand)
  end
  puts "|                    |"
  puts "----------------------"
  puts "----------------------"
  puts "|                    | #{name} Total: [#{total("player", player_hand, computer_hand, POINTS)}]"
  puts display_hands("player", player_hand)
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
    puts "dealer wins"
  elsif computer_total == player_total
    puts "push"
  else 
    puts "player wins"
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
  name = gets.chomp.capitalize!
end while name.empty?

POINTS = { "A" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9, "JACK" => 10, "QUEEN" => 10, "KING" => 10 }
begin
  decks = { "A" => [1, 1, 1, 1], "2" => [2, 2, 2, 2], "3" => [3, 3, 3, 3], "4" => [4, 4, 4, 4], "5" => [5, 5, 5, 5], "6" => [6, 6, 6, 6], "7" => [7, 7, 7, 7], "8" => [8, 8, 8, 8], "9" => [9, 9, 9, 9], "JACK" => [10, 10, 10, 10], "QUEEN" => [10, 10, 10, 10], "KING" => [10, 10, 10, 10] }
  player_hand = []
  computer_hand = []
  player_hand = decks.keys.sample 2
  remove_cards_from_decks(player_hand, decks, true)
  computer_hand = decks.keys.sample 2
  remove_cards_from_decks(computer_hand, decks, true)
  draw_game_board(name, player_hand, computer_hand, decks, true)
  begin
    begin
      puts "Hit (H) or Stay (S)"
      player_response = gets.chomp.upcase!
    end until player_response == "H" || player_response == "S"
    if player_response == "H" 
      puts "#{name} hits"
      player_hand.push(decks.keys.sample)
      remove_cards_from_decks(player_hand, decks, false)
      draw_game_board(name, player_hand, computer_hand, decks, true)
      break if total("player", player_hand, computer_hand, POINTS) > 21
    else 
      puts "#{name} stands"
    end
  end until player_response == "S"
  if total("player", player_hand, computer_hand, POINTS) <= 21
    draw_game_board(name, player_hand, computer_hand, decks, false)
    while total("computer", player_hand, computer_hand, POINTS) < 17
      puts "Dealer hits"
      computer_hand.push(decks.keys.sample)
      remove_cards_from_decks(computer_hand, decks, false)
      draw_game_board(name, player_hand, computer_hand, decks, false)
    end
  end
  if total("computer", player_hand, computer_hand, POINTS) >= 17 && total("computer", player_hand, computer_hand, POINTS) <= 21
    puts "Dealer Stands"
    check_for_outcomes(name, total("player", player_hand, computer_hand, POINTS), total("computer", player_hand, computer_hand, POINTS))
  else
    check_for_outcomes(name, total("player", player_hand, computer_hand, POINTS), total("computer", player_hand, computer_hand, POINTS))
  end    
end while play_again_check?


    

    



