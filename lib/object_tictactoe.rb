class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    i = 0
    counter = 0
    while i < @board.length
      if (@board[i] == "X") || (@board[i] == "O")
        counter += 1
      end
      i += 1
    end
    return counter
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location)
    @board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input)
      display_board
    else
      turn
    end
  end

  def won?
    i = 0
    while i < WIN_COMBINATIONS.length
      if (@board[WIN_COMBINATIONS[i][0]] == @board[WIN_COMBINATIONS[i][1]]) && (@board[WIN_COMBINATIONS[i][1]] == @board[WIN_COMBINATIONS[i][2]]) && (@board[WIN_COMBINATIONS[i][1]] != " ")
        return WIN_COMBINATIONS[i]
      else
        false
      end
      i += 1
    end
  end

  def full?
    return true if !@board.include? " "
    false
  end

  def draw?
    if won?.is_a?(Array)
      return false
    end
    if full? == true
      return true
    end
    false
  end

  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end

  def winner
    return @board[won?[0]] if won?
    nil
  end

  def play
    i = 0
    while i < 9
      turn
      if over? && won?.is_a?(Array)
        puts "Congratulations #{winner}!"
        break
      elsif over? && draw?
        puts "Cats Game!"
        break
      end
      i += 1
    end
  end

end
