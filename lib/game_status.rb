def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won.
    end
  end
  false
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if full?(board) != true
    return false
  elsif won?(board) == false
    return true
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board) != false
    return true
  end
end

def winner(board)
  positions_array = won?(board)
  if positions_array == false
    return nil
  elsif board[positions_array[0]].to_s == "X" || board[positions_array[0]].to_s == "O"
    return board[positions_array[0]].to_s
  end
end
