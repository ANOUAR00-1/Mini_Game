import 'dart:io';
import 'dart:math';

class GameLevel {
  final int min;
  final int max;
  final String name;
  final int baseScore;

  GameLevel(this.min, this.max, this.name, this.baseScore);
}

class Stats {
  int gamesPlayed = 0;
  int wins = 0;
  int totalScore = 0;
  int highScore = 0;
  List<int> topScores = [];
  
  void recordWin(int score) {
    gamesPlayed++;
    wins++;
    totalScore += score;
    if (score > highScore) highScore = score;
    
    topScores.add(score);
    topScores.sort((a, b) => b.compareTo(a));
    if (topScores.length > 5) topScores = topScores.sublist(0, 5);
  }
  
  void display() {
    print('\n--- Statistics ---');
    print('Games Played: ');
    print('Wins: ');
    print('Total Score: ');
    print('High Score: ');
  }
  
  void showLeaderboard() {
    print('\n--- Top 5 Scores ---');
    if (topScores.isEmpty) {
      print('No scores yet. Start playing!');
    } else {
      for (int i = 0; i < topScores.length; i++) {
        print('.  points');
      }
    }
  }
}

Stats stats = Stats();

void main() {
  print('Number Guessing Game v1.0');
  
  while (true) {
    print('\n1. Play Game');
    print('2. View Stats');
    print('3. Leaderboard');
    print('4. Exit');
    stdout.write('Select: ');
    String? choice = stdin.readLineSync();
    
    if (choice == '4') {
      print('Thanks for playing!');
      break;
    } else if (choice == '1') {
      playGame();
    } else if (choice == '2') {
      stats.display();
    } else if (choice == '3') {
      stats.showLeaderboard();
    }
  }
}

void playGame() {
  var levels = [
    GameLevel(1, 50, 'Easy', 500),
    GameLevel(1, 100, 'Medium', 1000),
    GameLevel(1, 200, 'Hard', 2000),
  ];

  print('\nSelect Difficulty:');
  print('1. Easy (1-50)');
  print('2. Medium (1-100)');
  print('3. Hard (1-200)');
  stdout.write('> ');
  
  int choice = int.tryParse(stdin.readLineSync() ?? '2') ?? 2;
  GameLevel level = levels[choice - 1] ?? levels[1];
  
  var random = Random();
  int target = random.nextInt(level.max - level.min + 1) + level.min;
  int attempts = 0;

  print('\nGuess a number between  and ');

  while (true) {
    stdout.write('Your guess: ');
    int? guess = int.tryParse(stdin.readLineSync() ?? '');
    
    if (guess == null) {
      print('Please enter a valid number');
      continue;
    }
    
    if (guess < level.min || guess > level.max) {
      print('Number must be between  and ');
      continue;
    }
    
    attempts++;
    int diff = (guess - target).abs();
    
    if (guess < target) {
      if (diff > 20) {
        print('Too low!');
      } else if (diff > 5) {
        print('A bit low, getting warmer!');
      } else {
        print('Very close! Slightly higher.');
      }
    } else if (guess > target) {
      if (diff > 20) {
        print('Too high!');
      } else if (diff > 5) {
        print('A bit high, getting warmer!');
      } else {
        print('Very close! Slightly lower.');
      }
    } else {
      int score = max(0, level.baseScore - (attempts * 50));
      print('\nCongratulations! You guessed it!');
      print('Attempts: ');
      print('Score:  points');
      stats.recordWin(score);
      break;
    }
  }
}
