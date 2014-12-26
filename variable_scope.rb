hash = {"A" => 10}
puts hash
def change_hash(hash)
  hash["A"] = 1
end
change_hash(hash)
puts hash