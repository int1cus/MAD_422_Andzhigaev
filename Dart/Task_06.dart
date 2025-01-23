/*
Задача 6: Проверка простого числа
Условие:
Пользователь вводит целое число. Программа должна проверить,
является ли это число простым (делится только на 1 и само на себя).
*/
import 'dart:io';
import 'dart:math';

void main() {
  try {
    stdout.write("Введите целое число: ");
    int number = int.parse(stdin.readLineSync()!);
    if (number > 1) {
      for (int i = 2; i < sqrt(number) + 1; i++) {
        if (number % i == 0) {
          stdout.write("Число $number не является простым.");
          break;
        }
        else {
          stdout.write("Число $number - простое.");
          break;
        }
      }
    }
    else {
      stdout.write("Число $number не является простым.");
    }
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}