/*
Задача 17: Простые числа в диапазоне
Условие:
Пользователь вводит два целых числа A и B. Программа должна
вывести все простые числа в этом диапазоне (включительно).
*/
import 'dart:io';
import 'dart:math';

void main() {
  try {
    stdout.write("Введите целое число А: ");
    int A = int.parse(stdin.readLineSync()!);

    stdout.write("Введите целое число B: ");
    int B = int.parse(stdin.readLineSync()!);

    for (int i = A; i <= B; i++) {
      if (isPrime(i)) {
        stdout.write("$i ");
      }
    }
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}

bool isPrime(int num) {
  if (num < 2) {
    return false;
  }
    for (int i = 2; i * i <= num; i++) {
      if (num % i == 0) {
        return false;
      }
    }
    return true;
}
