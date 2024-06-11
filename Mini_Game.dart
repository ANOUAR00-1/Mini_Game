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

  print('Guess a number between 1 and ');

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
      print('Number must be between 1 and ');
      continue;
    }
    
    attempts++;
    
    if (guess < target) {
      print('Too low!');
    } else if (guess > target) {
      print('Too high!');
    } else {
      int score = max(0, baseScore - (attempts * 50));
      print('Correct! You won in  attempts');
      print('Your score:  points');
      break;
    }
  }
}
