#Word guessing game from fallout 3

def correct_positions(actual, guess)
  correct_positions = 0
  #split both into array of chars and zip together
  compare_arr = actual.split('').zip(guess.split(''))
  #compare each character and count how many in correct position
  compare_arr.each do |actual_letter, guess_letter|
    if actual_letter==guess_letter
      correct_positions += 1
    end
  end
  return correct_positions
end


word_list = ['text', 'map', 'field', 'car', 'shop', 'love', 'see', 'red', 'home']

#Computer picks a word at random from word_list
word = word_list[rand(word_list.length)]
puts "The word is #{word.length} letters in length."

guess_incorrect = true
while guess_incorrect
  print 'Enter guess: '
  guess = gets.chomp

  #guess must be same length as chosen word
  if guess.length != word.length
    begin
      raise ArgumentError.new("Guess must be a #{word.length} letter word.")
    rescue ArgumentError => e
      puts 'Invalid guess.'
      puts e.message
      next
    end
  end

  cor_pos = correct_positions(word, guess)
  if cor_pos == word.length
    guess_incorrect = false
    puts 'Correct guess, well done!'
  else
    puts 'Incorrect guess. :-('
  end
  puts "#{cor_pos} out of #{word.length} letters in the correct position.\n"

end
