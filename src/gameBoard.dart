List<List<String>> gameBoard = [
  ["*", "*", "*", "*", "*", "*", "*", "*"],
  ["*", "*", "*", "*", "*", "*", "*", "*"],
  ["*", "*", "*", "*", "*", "*", "*", "*"],
  ["*", "*", "*", "*", "*", "*", "*", "*"],
  ["*", "*", "*", "*", "*", "*", "*", "*"],
  ["*", "*", "*", "*", "*", "*", "*", "*"],
  ["*", "*", "*", "*", "*", "*", "*", "*"],
  ["*", "*", "*", "*", "*", "*", "*", "*"]
];

void printBoard () {
  print("    1      2      3      4      5      6      7      8");
  for (int i = 0; i < gameBoard.length; i++) {
    String line = "    ";
    for (int j = 0; j < gameBoard[i].length; j++) {
      line += "${gameBoard[i][j]}      ";
    }
    line += '\n';
    print(line);
  }
  print("  ------------------------------------------------------");
}