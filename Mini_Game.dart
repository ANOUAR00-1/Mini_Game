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
      print('Correct! You won in  attempts');
      break;
    }
  }
}
