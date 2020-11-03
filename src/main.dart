import "dart:io";
import "gameBoard.dart";
import 'playGame.dart';
import "winner.dart";

bool turn = true; // player 1 is true, player 2 is false
bool winner = false;

void prompt (bool player) {
  if (player) {
    print("Player 1, choose a column");
    String selectedColumn = stdin.readLineSync();

    try {
      int testNumber = int.parse(selectedColumn);

      if (testNumber > 8 || testNumber < 1) {
        print("Your number must be in the range 1-8");
        prompt(player);
      } else {
        playGame(selectedColumn, true);
      }
    }
    on FormatException {
      print("You must enter a valid number");
      prompt(player);
    }
  } else {
    print("Player 2, choose a column");
    String selectedColumn = stdin.readLineSync();

    try {
      int testNumber = int.parse(selectedColumn);

      if (testNumber > 8 || testNumber < 1) {
        print("Your number must be in the range 1-8");
        prompt(player);
      } else {
        playGame(selectedColumn, true);
      }
    } on FormatException {
      print("You must enter a valid number");
      prompt(player);
    }
  }
}

void main () {
  print("Connect 4");
  print("Player 1 controls the X chips");
  print("Player 2 controls the O chips");
  while (!winner) {
    printBoard();
    if (turn == true) {
      prompt(true);

      if (determineWinner(true)) {
        print ("Player 1 wins");
        winner = true;
      } else {
        turn = false;
      }
    } else {
      prompt(false);

      if (determineWinner(false)) {
        print ("Player 2 wins");
        winner = true;
      } else {
        turn = true;
      }
    }
  }
}