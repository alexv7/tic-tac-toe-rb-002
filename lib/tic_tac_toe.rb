def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player(board)
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  i = 0
  counter = 0
  while i < board.length
    if (board[i] == "X") || (board[i] == "O")
      counter += 1
    end
    i += 1
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
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

def won?(board)
  i = 0
  while i < WIN_COMBINATIONS.length
    if (board[WIN_COMBINATIONS[i][0]] == board[WIN_COMBINATIONS[i][1]]) && (board[WIN_COMBINATIONS[i][1]] == board[WIN_COMBINATIONS[i][2]]) && (board[WIN_COMBINATIONS[i][1]] != " ")
      return WIN_COMBINATIONS[i]
    else
      false
    end
    i += 1
  end
end

def full?(board)
  return true if !board.include? " "
  false
end

def draw?(board)
  if won?(board).is_a?(Array)
    return false
  end
  if full?(board) == true
    return true
  end
  false
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  return board[won?(board)[0]] if won?(board)
  nil
end

def play(board)
  i = 0
  while i < 9
    turn(board)
    if over?(board) && won?(board).is_a?(Array)
      puts "Congratulations #{winner(board)}!"
      break
    elsif over?(board) && draw?(board)
      puts "Cats Game!"
      break
    end
    i += 1
  end
end
