require "./player"

class MathGame
  def initialize
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @current_player = @player1
  end

  # give the question
  def generate_numbers
    num1 = rand(1..20)
    num2 = rand(1..20)
    [num1, num2]
  end

  # check the answer
  def ask_question(player)
    num1, num2 = generate_numbers
    puts "#{player.name}: What is #{num1} + #{num2}?"
    player_answer = gets.chomp.to_i
    correct_answer = num1 + num2

    if player_answer == correct_answer
      puts "#{player.name}: Yes! you are correct."
    else
      puts "#{player.name}: Seriously? No!"
      player.lose_life
    end
    # other = (@current_player == @player1)? @player2 : @player1
    # puts "#{player.name} : #{player.lives} /3 vs #{other.name}: #{other.lives} /3"
    puts "#{@player1.name} : #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def switch_turns
    puts "-------NEW TURN-------"
    @current_player = (@current_player == @player1)? @player2 : @player1
  end

  def game_over？
    @player1.lives.zero? || @player2.lives.zero?
  end

  def announce_winner
    winner = @player1.lives.zero? ? @player2 : @player1
    loser = @player1.lives.zero? ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives} / 3"
    # puts "#{loser.name}: Your final score is #{loser.lives}"
  end
  
  def play
    until game_over？
      ask_question(@current_player)
      switch_turns
    end
    puts "...some time later ..."
    announce_winner
    puts "-----GAME OVER -----"
    puts "Good Bye !"

  
  end

end