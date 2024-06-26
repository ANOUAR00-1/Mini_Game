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
    print('Games:  | Wins: ');
    print('Total Score:  | High Score: ');
  }
  
  void showLeaderboard() {
    print('\n--- Top 5 Scores ---');
    for (int i = 0; i < topScores.length; i++) {
      print('.  points');
    }
  }
}

Stats stats = Stats();

void main() {
  while (true) {
    print('\n1. Play | 2. Stats | 3. Leaderboard | 4. Exit');
    stdout.write('> ');
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

  print('\n1. Easy | 2. Medium | 3. Hard');
  stdout.write('> ');
  int choice = int.tryParse(stdin.readLineSync() ?? '2') ?? 2;
  GameLevel level = levels[choice - 1] ?? levels[1];
  
  var random = Random();
  int target = random.nextInt(level.max - level.min + 1) + level.min;
  int attempts = 0;

  print('Range: -');

  while (true) {
    stdout.write('Guess: ');
    int? guess = int.tryParse(stdin.readLineSync() ?? '');
    
    if (guess == null || guess < level.min || guess > level.max) {
      print('Invalid!');
      continue;
    }
    
    attempts++;
    int diff = (guess - target).abs();
    
    if (guess < target) {
      if (diff > 20) print('Too low!');
      else if (diff > 5) print('A bit low');
      else print('Very close! Higher');
    } else if (guess > target) {
      if (diff > 20) print('Too high!');
      else if (diff > 5) print('A bit high');
      else print('Very close! Lower');
    } else {
      int score = max(0, level.baseScore - (attempts * 50));
      print('Won!  tries | Score: ');
      stats.recordWin(score);
      break;
    }
  }
}
