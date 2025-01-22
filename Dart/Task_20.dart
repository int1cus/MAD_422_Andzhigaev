/*
Задача 20: Число Армстронга
Условие:
Пользователь вводит целое число. Программа должна проверить,
является ли это число числом Армстронга (сумма цифр в степени,
равной количеству цифр, равна самому числу).
*/
import 'dart:io';
import 'dart:math';

void main() {
  try {
    stdout.write("Введите целое число: ");
    int number = int.parse(stdin.readLineSync()!);

    if (isArmstrong(number)) {
      print("Число $number является числом Армстронга.");
    } else {
      print("Число $number не является числом Армстронга.");
    }
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}

bool isArmstrong(int number) {
  int originalNumber = number;
  int numDigits = 0;
  int tmp = number;

  while (tmp > 0) {
    tmp ~/= 10;
    numDigits++;
  }
  
  int sum = 0;
  tmp = number;

  while (tmp > 0) {
    int digit = tmp % 10;
    sum += pow(digit, numDigits).toInt();
    tmp ~/= 10;
  }

  return sum == originalNumber;
}
