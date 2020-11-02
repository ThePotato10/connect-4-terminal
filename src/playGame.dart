import "gameBoard.dart";

void playGame (String column, bool player) {
  // Bool player: player1 = true, player2 = false
  int columnNumber = int.parse(column) - 1;
  String symbol = (player) ? "X" : "O";

  // First number is row, second is column
  for (int i = 7; i >= 0; i--) {
    if (gameBoard[i][columnNumber] == "*") {
      gameBoard[i][columnNumber] = symbol;
      break;
    }
  }
}