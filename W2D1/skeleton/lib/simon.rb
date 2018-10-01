class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    if @game_over == false
      round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    seq.each { |color| puts color }
  end

  def require_sequence
    puts "Please repeat the sequence given. E.g., (red, green, yellow): "
    user_seq = gets.chomp.split(", ")
    @game_over == true unless user_seq == @seq
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Round successful!"
  end

  def game_over_message
    puts "You did not follow Simon's directions so you lost :("
  end

  def reset_game
    initialize
    # @sequence_length = 1
    # @game_over = false
    # @seq = []
  end
end
