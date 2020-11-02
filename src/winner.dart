import "gameBoard.dart";

bool findInRow (List<String> row, String symbol) {
  int streak = 0;

  for (int i = 0; i < row.length; i++) {
    if (row[i] == symbol) {
      streak++;
      if (streak >= 4) {
        break;
      }
    } else {
      streak = 0;
    }
  }

  if (streak >= 4) {
    return true;
  } else {
    return false;
  }
}

bool findInColumn (List<List<String>> board, String symbol) {
  int streak = 0;
  bool found = false;

  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      if (board[j][i] == symbol) {
        streak++;
        if (streak >= 4) {
          found = true;
          break;
        }
      } else {
        streak = 0;
      }
    }
  }
  return found;
}

bool determineWinner (bool player) {
  String symbol = (player) ? "X" : "O";
  bool found = false;

  for (int i = 0; i < gameBoard.length; i++) {
    if (findInRow(gameBoard[i], symbol)) {
      found = true;
    }
  }

  if (findInColumn(gameBoard, symbol)) {
    found = true;
  }

  return found;
}