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
  print('1. ');
  print('2. ');
  print('3. ');
  
  stdout.write('Choice: ');
  int choice = int.tryParse(stdin.readLineSync() ?? '') ?? 2;
  
  GameLevel level = medium;
  if (choice == 1) level = easy;
  if (choice == 3) level = hard;
  
  var random = Random();
  int target = random.nextInt(level.max - level.min + 1) + level.min;
  int attempts = 0;

  print('Guess between  and ');

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
      print('Won! Attempts: , Score: ');
      break;
    }
  }
}
