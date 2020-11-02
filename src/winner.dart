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

bool findDiagonalDown (List<List<String>> board, String symbol) {
  // Goes from top-right to bottom-left
  bool found = false;

  for (int i = 0; i < 5; i++) { // Loops over the rows in the board where a diagonal of this type is possible
    for (int j = 0; j < 5; j++) { // Loops over the columns where a diagonal of this is possible
      if (board[i][j] == symbol) {
        if (board[i + 1][j + 1] == symbol) {
          if (board[i + 2][j + 2] == symbol) {
            if (board[i + 3][j + 3] == symbol) {
              found = true;
            }
          }
        }
      }
    }
  }

  return found;
}

bool findDiagonalUp (List<List<String>> board, String symbol) {
  // Goes from bottom-right to top-left
  bool found = false;

  for (int i = 3; i < 8; i++) {
    for (int j = 0; j < 5; j++) {
      if (board[i][j] == symbol) {
        if (board[i - 1][j + 1] == symbol) {
          if (board[i - 2][j + 2] == symbol) {
            if (board[i - 3][j + 3] == symbol) {
              found = true;
            }
          }
        }
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

  if (findDiagonalDown(gameBoard, symbol)) {
    found = true;
  }

  if (findDiagonalUp(gameBoard, symbol)) {
    found = true;
  }

  return found;
}
