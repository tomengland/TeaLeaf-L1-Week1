decks = { "ACE" => [], "2" => [], "3" => [], "4" => [], "5" => [], "6" => [], "7" => [], "8" => [], "9" => [], "JACK" => [], "QUEEN" => [], "KING" => [] }
decks.each_key do |k|
  arr = []
  if k == "ACE" || k == "JACK" || k == "QUEEN" || k == "KING"
    8.times do
      arr << 10
    end
  else 
    8.times do
      arr << k.to_i
    end
  end
  decks[k] = arr
end


puts decks