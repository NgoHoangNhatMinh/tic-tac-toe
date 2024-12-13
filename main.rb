class Board
  def initialize
    @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  def display
    temp_board = ""
    for r in @board
      r = r.join(" ")
      temp_board += r + "\n"
    end
    puts temp_board
  end

  def update_position(player, pos)
    for i in 0..2
      for j in 0..2
        if pos == @board[i][j]
          @board[i][j] = player
        end
      end
    end
  end

  def check_valid_move?
    
  end

  def check_win
    if @board[0][0] == @board[0][1] && @board[0][1] == @board[0][2]
      true
    elsif @board[1][0] == @board[1][1] && @board[1][1] == @board[1][2]
      true
    elsif @board[2][0] == @board[2][1] && @board[2][1] == @board[2][2]
      true
    elsif @board[0][0] == @board[1][0] && @board[1][0] == @board[2][0]
      true
    elsif @board[0][1] == @board[1][1] && @board[1][1] == @board[2][1]
      true
    elsif @board[0][2] == @board[1][2] && @board[1][2] == @board[2][2]
      true
    elsif @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
      true
    elsif @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
      true
    else
      false
    end
  end
end

class Player
  
end

game_over = false
current_player = "X"

b = Board.new
puts "Would player 1 like to play as X or O?"
player_1 = gets.chomp.upcase
player_2 = player_1 == "X" ? "O" : "X"

while !game_over
  if player_1 == current_player
    puts "Player 1, enter a number you would like to go: "
    pos = gets.chomp.to_i
    b.update_position(player_1, pos)
  else
    puts "Player 2, enter a number you would like to go: "
    pos = gets.chomp.to_i
    b.update_position(player_2, pos)
  end
  
  current_player = current_player == "X" ? "O" : "X"
  b.display
  game_over = b.check_win
end

winner = current_player == "X" ? "O" : "X"
puts "#{winner} wins"
