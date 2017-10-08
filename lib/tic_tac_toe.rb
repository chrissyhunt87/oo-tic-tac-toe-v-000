class TicTacToe

  def initialize(board)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left col
    [1,4,7], #middle col
    [2,5,8], #right col
    [0,4,8], #l to r diagonal
    [2,4,6] #r to l diagonal
  ]

  def display_board(@board)
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(@board, location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(@board, index)
    index.between?(0,8) && !position_taken?(@board, index)
  end

  def turn(@board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(@board, index)
      move(@board, index, current_player(@board))
      display_board(@board)
    else
      turn(@board)
    end
  end

  def turn_count(@board)
    turns = 0
    @board.each do | space |
      if space == "X" || space == "O"
        turns += 1
      end
    end
    return turns
  end

  def current_player(@board)
    if turn_count(@board) % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?(@board)
    win = false
    WIN_COMBINATIONS.each do | win_combo |
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") ||
        (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
        win = win_combo
      end
    end
    return win
  end

end
