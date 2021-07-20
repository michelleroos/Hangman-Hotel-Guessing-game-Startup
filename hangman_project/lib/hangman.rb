class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses 

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index {|ele, i| indices << i if ele == char}
    indices
  end

  def fill_indices(char, arr)
    arr.each { |idx| @guess_word[idx] = char }
  end

  # def fill_indices(char, arr)
  #   @guess_word.map!.with_index do |ele, i| 
  #     if arr.include?(i) 
  #       ele = char
  #     else
  #       ele
  #     end
  #   end
  # end

  def try_guess(char)
    if self.already_attempted?(char)
      puts 'that has already been attempted'
      return false
    else
      @attempted_chars.push(char)
      if self.get_matching_indices(char).empty?
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, self.get_matching_indices(char))
      end
      return true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @guess_word.join('') == @secret_word
      puts 'WIN'
      return true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true
    else
      false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else  
      false  
    end 
  end

end


