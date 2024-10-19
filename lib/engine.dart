import 'dart:math';

class Engine {
  List<List<String>> board =
      List.generate(3, (index) => List.filled(3, '')); //Game Board
  String currentPlayer = 'x'; //Current player

  String handleClick(int row, int col) {
    if (board[row][col] == '') {
      board[row][col] = currentPlayer;
    }
    String result = checkDrawOrWin();
    currentPlayer = currentPlayer == 'x' ? 'o' : 'x';
    if (result == "") {
      // If the game is still ongoing, call the AI's move
      aiMove();
      result = checkDrawOrWin(); // Check again after AI's move
    }
    return result;
  }

  playAgain() {
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        board[i][j] = ''; // Reset each cell to an empty string
      }
    }

    currentPlayer = 'x';
  }

  String checkDrawOrWin() {
    String result = checkForWin();
    if (result != "") {
      return result;
    }

    if (isDraw()) {
      return "Match is Draw";
    }

    return "";
  }

  String checkForWin() {
    for (int i = 0; i < 3; i++) {
      // Check rows and columns
      if (board[i][0] != '' &&
          board[i][0] == board[i][1] &&
          board[i][1] == board[i][2]) {
        return board[i][0] == 'o' ? "O won the match" : "X won the match";
      }
      if (board[0][i] != '' &&
          board[0][i] == board[1][i] &&
          board[1][i] == board[2][i]) {
        return board[0][i] == 'o' ? "O won the match" : "X won the match";
      }
    }
    // Check diagonals
    if (board[0][0] != '' &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
      return board[0][0] == 'o' ? "O won the match" : "X won the match";
    }
    if (board[0][2] != '' &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
      return board[0][2] == 'o' ? "O won the match" : "X won the match";
    }
    return "";
  }

  bool isDraw() {
    for (var row in board) {
      for (var cell in row) {
        if (cell == '') {
          return false;
        }
      }
    }
    return true;
  }

  void aiMove() {
    int bestScore = -1000;
    int moveRow = -1;
    int moveCol = -1;

    for (var i = 0; i < 3; i++) {
      for (var j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = 'o'; // AI Move
          int score = miniMax(false);
          board[i][j] = ''; // Undo Move
          if (score > bestScore) {
            bestScore = score;
            moveRow = i;
            moveCol = j;
          }
        }
      }
    }

    if (moveRow != -1 && moveCol != -1) {
      board[moveRow][moveCol] = 'o'; // Make the best move
      currentPlayer = 'x'; // Switch back to the player
    }
  }

  // It is a minimax algo which used to generate best possible move
  int miniMax(bool isMaximizing) {
    String result = checkForWin();
    if (result == "X won the match") return -1; // "X" wins
    if (result == "O won the match") return 1; // "O" wins
    if (isDraw()) return 0; // Draw

    if (isMaximizing) {
      int bestScore = -1000;
      for (var i = 0; i < 3; i++) {
        for (var j = 0; j < 3; j++) {
          if (board[i][j] == '') {
            board[i][j] = 'o'; // AI Move
            int score = miniMax(false);
            board[i][j] = ''; // Undo Move
            bestScore = max(score, bestScore); // Use max to find the best score
          }
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == '') {
            board[i][j] = 'x'; // Player's move
            int score = miniMax(true); // Call minimax recursively
            board[i][j] = ''; // Undo the move
            bestScore = min(score,
                bestScore); // Use min to find the best score for minimizing player
          }
        }
      }
      return bestScore;
    }
  }
}
