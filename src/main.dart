import "dart:io";
import "gameBoard.dart";
import 'playGame.dart';
import "winner.dart";

bool turn = true; // player 1 is true, player 2 is false
bool winner = false;

void main () {
  print("Connect 4");
  print("Player 1 controls the X chips");
  print("Player 2 controls the O chips");
  while (!winner) {
    printBoard();
    if (turn == true) {
      print("Player 1, choose a column");
      String selectedColumn = stdin.readLineSync();

      playGame(selectedColumn, true);

      if (determineWinner(true)) {
        print ("Player 1 wins");
        winner = true;
      } else {
        turn = false;
      }
    } else {
      print("Player 2, choose a column");
      String selectedColumn = stdin.readLineSync();

      playGame(selectedColumn, false);

      if (determineWinner(false)) {
        print ("Player 2 wins");
        winner = true;
      } else {
        turn = true;
      }
    }
  }
}