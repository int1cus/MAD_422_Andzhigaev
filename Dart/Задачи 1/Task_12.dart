/*
Задача 12: Сумма цифр числа
Условие:
Пользователь вводит целое число. Программа должна найти сумму всех цифр этого числа.
*/
import 'dart:io';

void main() {
  try {
    stdout.write("Введите целое число: ");
    int number = int.parse(stdin.readLineSync()!);
    int tmp = number;
    int sum = 0;
    while (tmp != 0) {
      int last = tmp % 10;
      sum += last;
      tmp ~/= 10;
    }
    stdout.write("Сумма цифр числа $number = $sum");
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}