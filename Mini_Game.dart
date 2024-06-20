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
  
  void recordWin(int score) {
    gamesPlayed++;
    wins++;
    totalScore += score;
  }
  
  void display() {
    print('\n--- Statistics ---');
    print('Games Played: ');
    print('Wins: ');
    print('Total Score: ');
  }
}

Stats stats = Stats();

void main() {
  while (true) {
    print('\n--- Main Menu ---');
    print('1. Play Game');
    print('2. View Stats');
    print('3. Exit');
    
    stdout.write('Choice: ');
    String? choice = stdin.readLineSync();
    
    if (choice == '3') {
      print('Bye!');
      break;
    } else if (choice == '1') {
      playGame();
    } else if (choice == '2') {
      stats.display();
    }
  }
}

void playGame() {
  var levels = [
    GameLevel(1, 50, 'Easy', 500),
    GameLevel(1, 100, 'Medium', 1000),
    GameLevel(1, 200, 'Hard', 2000),
  ];

  print('\nSelect:');
  for (int i = 0; i < levels.length; i++) {
    print('. ');
  }
  
  stdout.write('Choice: ');
  int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 2;
  GameLevel level = levels[choice - 1] ?? levels[1];
  
  var random = Random();
  int target = random.nextInt(level.max - level.min + 1) + level.min;
  int attempts = 0;

  print('Guess -');

  while (true) {
    stdout.write('Guess: ');
    int? guess = int.tryParse(stdin.readLineSync() ?? '');
    
    if (guess == null || guess < level.min || guess > level.max) {
      print('Invalid');
      continue;
    }
    
    attempts++;
    
    if (guess < target) {
      print('Low');
    } else if (guess > target) {
      print('High');
    } else {
      int score = max(0, level.baseScore - (attempts * 50));
      print('Won! Attempts: , Score: ');
      stats.recordWin(score);
      break;
    }
  }
}
