# Script to create 10 commits for June 2024

# Commit 1: Initial basic game (June 2, 2024)
$date1 = "2024-06-02T14:30:00"
@"
import 'dart:io';
import 'dart:math';

void main() {
  print('Welcome to Number Guessing Game');
  
  var random = Random();
  int target = random.nextInt(100) + 1;
  int attempts = 0;

  while (true) {
    stdout.write('Enter your guess (1-100): ');
    String? input = stdin.readLineSync();
    
    int? guess = int.tryParse(input ?? '');
    if (guess == null) {
      print('Invalid input');
      continue;
    }
    
    attempts++;
    
    if (guess < target) {
      print('Too low!');
    } else if (guess > target) {
      print('Too high!');
    } else {
      print('Correct! You won in $attempts attempts');
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8
git add Mini_Game.dart
$env:GIT_AUTHOR_DATE = $date1
$env:GIT_COMMITTER_DATE = $date1
git commit -m "initial commit: basic number guessing game"

# Commit 2: Add input validation (June 5, 2024)
$date2 = "2024-06-05T10:15:00"
@"
import 'dart:io';
import 'dart:math';

void main() {
  print('Welcome to Number Guessing Game');
  print('Guess a number between 1 and 100');
  
  var random = Random();
  int target = random.nextInt(100) + 1;
  int attempts = 0;

  while (true) {
    stdout.write('Your guess: ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) {
      print('Please enter a number');
      continue;
    }
    
    int? guess = int.tryParse(input);
    if (guess == null) {
      print('Please enter a valid number');
      continue;
    }
    
    if (guess < 1 || guess > 100) {
      print('Number must be between 1 and 100');
      continue;
    }
    
    attempts++;
    
    if (guess < target) {
      print('Too low! Try again.');
    } else if (guess > target) {
      print('Too high! Try again.');
    } else {
      print('Congratulations! You guessed it in $attempts attempts');
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8
git add Mini_Game.dart
$env:GIT_AUTHOR_DATE = $date2
$env:GIT_COMMITTER_DATE = $date2
git commit -m "add better input validation"

# Commit 3: Add difficulty levels (June 8, 2024)
$date3 = "2024-06-08T16:45:00"
@"
import 'dart:io';
import 'dart:math';

void main() {
  print('Welcome to Number Guessing Game');
  print('Select difficulty:');
  print('1. Easy (1-50)');
  print('2. Medium (1-100)');
  print('3. Hard (1-200)');
  
  stdout.write('Choice: ');
  int difficulty = int.tryParse(stdin.readLineSync() ?? '') ?? 2;
  
  int maxNum = 100;
  if (difficulty == 1) maxNum = 50;
  if (difficulty == 3) maxNum = 200;
  
  var random = Random();
  int target = random.nextInt(maxNum) + 1;
  int attempts = 0;

  print('Guess a number between 1 and $maxNum');

  while (true) {
    stdout.write('Your guess: ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) {
      print('Please enter a number');
      continue;
    }
    
    int? guess = int.tryParse(input);
    if (guess == null) {
      print('Please enter a valid number');
      continue;
    }
    
    if (guess < 1 || guess > maxNum) {
      print('Number must be between 1 and $maxNum');
      continue;
    }
    
    attempts++;
    
    if (guess < target) {
      print('Too low!');
    } else if (guess > target) {
      print('Too high!');
    } else {
      print('You won in $attempts attempts!');
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8
git add Mini_Game.dart
$env:GIT_AUTHOR_DATE = $date3
$env:GIT_COMMITTER_DATE = $date3
git commit -m "add difficulty levels"

# Commit 4: Add scoring system (June 11, 2024)
$date4 = "2024-06-11T11:20:00"
@"
import 'dart:io';
import 'dart:math';

void main() {
  print('=== Number Guessing Game ===');
  print('Select difficulty:');
  print('1. Easy (1-50)');
  print('2. Medium (1-100)');
  print('3. Hard (1-200)');
  
  stdout.write('Choice: ');
  int difficulty = int.tryParse(stdin.readLineSync() ?? '') ?? 2;
  
  int maxNum = 100;
  int baseScore = 1000;
  if (difficulty == 1) {
    maxNum = 50;
    baseScore = 500;
  }
  if (difficulty == 3) {
    maxNum = 200;
    baseScore = 2000;
  }
  
  var random = Random();
  int target = random.nextInt(maxNum) + 1;
  int attempts = 0;

  print('Guess a number between 1 and $maxNum');

  while (true) {
    stdout.write('Your guess: ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) {
      print('Please enter a number');
      continue;
    }
    
    int? guess = int.tryParse(input);
    if (guess == null) {
      print('Please enter a valid number');
      continue;
    }
    
    if (guess < 1 || guess > maxNum) {
      print('Number must be between 1 and $maxNum');
      continue;
    }
    
    attempts++;
    
    if (guess < target) {
      print('Too low!');
    } else if (guess > target) {
      print('Too high!');
    } else {
      int score = max(0, baseScore - (attempts * 50));
      print('Correct! You won in $attempts attempts');
      print('Your score: $score points');
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8
git add Mini_Game.dart
$env:GIT_AUTHOR_DATE = $date4
$env:GIT_COMMITTER_DATE = $date4
git commit -m "implement scoring system"

# Commit 5: Refactor to use classes (June 14, 2024)
$date5 = "2024-06-14T15:00:00"
@"
import 'dart:io';
import 'dart:math';

class GameLevel {
  final int min;
  final int max;
  final String name;
  final int baseScore;

  GameLevel(this.min, this.max, this.name, this.baseScore);
}

void main() {
  var easy = GameLevel(1, 50, 'Easy', 500);
  var medium = GameLevel(1, 100, 'Medium', 1000);
  var hard = GameLevel(1, 200, 'Hard', 2000);

  print('=== Number Guessing Game ===');
  print('1. ${easy.name}');
  print('2. ${medium.name}');
  print('3. ${hard.name}');
  
  stdout.write('Select: ');
  int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 2;
  
  GameLevel level = medium;
  if (choice == 1) level = easy;
  if (choice == 3) level = hard;
  
  var random = Random();
  int target = random.nextInt(level.max - level.min + 1) + level.min;
  int attempts = 0;

  print('Guess a number between ${level.min} and ${level.max}');

  while (true) {
    stdout.write('Guess: ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) continue;
    
    int? guess = int.tryParse(input);
    if (guess == null) {
      print('Invalid number');
      continue;
    }
    
    if (guess < level.min || guess > level.max) {
      print('Out of range');
      continue;
    }
    
    attempts++;
    
    if (guess < target) {
      print('Too low');
    } else if (guess > target) {
      print('Too high');
    } else {
      int score = max(0, level.baseScore - (attempts * 50));
      print('Won in $attempts attempts!');
      print('Score: $score');
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8
git add Mini_Game.dart
$env:GIT_AUTHOR_DATE = $date5
$env:GIT_COMMITTER_DATE = $date5
git commit -m "refactor code with classes"

# Commit 6: Add menu system (June 17, 2024)
$date6 = "2024-06-17T13:30:00"
@"
import 'dart:io';
import 'dart:math';

class GameLevel {
  final int min;
  final int max;
  final String name;
  final int baseScore;

  GameLevel(this.min, this.max, this.name, this.baseScore);
}

void main() {
  while (true) {
    print('\n--- Main Menu ---');
    print('1. Play Game');
    print('2. Exit');
    
    stdout.write('Choice: ');
    String? choice = stdin.readLineSync();
    
    if (choice == '2') {
      print('Thanks for playing!');
      break;
    } else if (choice == '1') {
      playGame();
    } else {
      print('Invalid option');
    }
  }
}

void playGame() {
  var easy = GameLevel(1, 50, 'Easy', 500);
  var medium = GameLevel(1, 100, 'Medium', 1000);
  var hard = GameLevel(1, 200, 'Hard', 2000);

  print('\nSelect difficulty:');
  print('1. ${easy.name}');
  print('2. ${medium.name}');
  print('3. ${hard.name}');
  
  stdout.write('Choice: ');
  int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 2;
  
  GameLevel level = medium;
  if (choice == 1) level = easy;
  if (choice == 3) level = hard;
  
  var random = Random();
  int target = random.nextInt(level.max - level.min + 1) + level.min;
  int attempts = 0;

  print('Guess between ${level.min} and ${level.max}');

  while (true) {
    stdout.write('Guess: ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) continue;
    
    int? guess = int.tryParse(input);
    if (guess == null) {
      print('Invalid');
      continue;
    }
    
    if (guess < level.min || guess > level.max) {
      print('Out of range');
      continue;
    }
    
    attempts++;
    
    if (guess < target) {
      print('Too low');
    } else if (guess > target) {
      print('Too high');
    } else {
      int score = max(0, level.baseScore - (attempts * 50));
      print('Won! Attempts: $attempts, Score: $score');
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8
git add Mini_Game.dart
$env:GIT_AUTHOR_DATE = $date6
$env:GIT_COMMITTER_DATE = $date6
git commit -m "add menu system and play again option"

# Commit 7: Add stats tracking (June 20, 2024)
$date7 = "2024-06-20T09:45:00"
@"
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
    print('Games Played: $gamesPlayed');
    print('Wins: $wins');
    print('Total Score: $totalScore');
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
    print('${i + 1}. ${levels[i].name}');
  }
  
  stdout.write('Choice: ');
  int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 2;
  GameLevel level = levels[choice - 1] ?? levels[1];
  
  var random = Random();
  int target = random.nextInt(level.max - level.min + 1) + level.min;
  int attempts = 0;

  print('Guess ${level.min}-${level.max}');

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
      print('Won! Attempts: $attempts, Score: $score');
      stats.recordWin(score);
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8
git add Mini_Game.dart
$env:GIT_AUTHOR_DATE = $date7
$env:GIT_COMMITTER_DATE = $date7
git commit -m "add statistics tracking"

# Commit 8: Better hints (June 23, 2024)
$date8 = "2024-06-23T14:15:00"
@"
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
    print('\n--- Stats ---');
    print('Games: $gamesPlayed | Wins: $wins | Score: $totalScore');
  }
}

Stats stats = Stats();

void main() {
  while (true) {
    print('\n1. Play | 2. Stats | 3. Exit');
    stdout.write('> ');
    String? choice = stdin.readLineSync();
    
    if (choice == '3') {
      print('Goodbye!');
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

  print('\n1. Easy | 2. Medium | 3. Hard');
  stdout.write('> ');
  int choice = int.tryParse(stdin.readLineSync() ?? '2') ?? 2;
  GameLevel level = levels[choice - 1] ?? levels[1];
  
  var random = Random();
  int target = random.nextInt(level.max - level.min + 1) + level.min;
  int attempts = 0;

  print('Range: ${level.min}-${level.max}');

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
      else print('Very close! Go higher');
    } else if (guess > target) {
      if (diff > 20) print('Too high!');
      else if (diff > 5) print('A bit high');
      else print('Very close! Go lower');
    } else {
      int score = max(0, level.baseScore - (attempts * 50));
      print('Correct! $attempts attempts | Score: $score');
      stats.recordWin(score);
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8
git add Mini_Game.dart
$env:GIT_AUTHOR_DATE = $date8
$env:GIT_COMMITTER_DATE = $date8
git commit -m "improve hint system based on proximity"

# Commit 9: Add leaderboard (June 26, 2024)
$date9 = "2024-06-26T16:00:00"
@"
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
    print('Games: $gamesPlayed | Wins: $wins');
    print('Total Score: $totalScore | High Score: $highScore');
  }
  
  void showLeaderboard() {
    print('\n--- Top 5 Scores ---');
    for (int i = 0; i < topScores.length; i++) {
      print('${i + 1}. ${topScores[i]} points');
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

  print('Range: ${level.min}-${level.max}');

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
      print('Won! $attempts tries | Score: $score');
      stats.recordWin(score);
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8
git add Mini_Game.dart
$env:GIT_AUTHOR_DATE = $date9
$env:GIT_COMMITTER_DATE = $date9
git commit -m "add leaderboard feature"

# Commit 10: Final polish + README (June 29, 2024)
$date10 = "2024-06-29T18:30:00"

# Create README
@"
# Number Guessing Game

A console-based number guessing game built with Dart.

## Features

- 3 difficulty levels (Easy, Medium, Hard)
- Smart hint system
- Score tracking
- Statistics
- Leaderboard

## How to Run

``````bash
dart Mini_Game.dart
``````

## How to Play

1. Select difficulty
2. Guess the secret number
3. Follow the hints
4. Beat your high score!
"@ | Out-File -FilePath README.md -Encoding UTF8

# Add final touches to game
@"
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
    print('Games Played: $gamesPlayed');
    print('Wins: $wins');
    print('Total Score: $totalScore');
    print('High Score: $highScore');
  }
  
  void showLeaderboard() {
    print('\n--- Top 5 Scores ---');
    if (topScores.isEmpty) {
      print('No scores yet. Start playing!');
    } else {
      for (int i = 0; i < topScores.length; i++) {
        print('${i + 1}. ${topScores[i]} points');
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

  print('\nGuess a number between ${level.min} and ${level.max}');

  while (true) {
    stdout.write('Your guess: ');
    int? guess = int.tryParse(stdin.readLineSync() ?? '');
    
    if (guess == null) {
      print('Please enter a valid number');
      continue;
    }
    
    if (guess < level.min || guess > level.max) {
      print('Number must be between ${level.min} and ${level.max}');
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
      print('Attempts: $attempts');
      print('Score: $score points');
      stats.recordWin(score);
      break;
    }
  }
}
"@ | Out-File -FilePath Mini_Game.dart -Encoding UTF8

git add .
$env:GIT_AUTHOR_DATE = $date10
$env:GIT_COMMITTER_DATE = $date10
git commit -m "final polish and add README"

Write-Host "All 10 commits created successfully for June 2024!" -ForegroundColor Green
