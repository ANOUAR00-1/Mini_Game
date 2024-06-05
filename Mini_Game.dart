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
      print('Congratulations! You guessed it in  attempts');
      break;
    }
  }
}
