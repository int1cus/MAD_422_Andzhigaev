/*
Задача 1: Четное или нечетное число
Условие:
Пользователь вводит целое число. Программа должна вывести,
является ли это число четным или нечетным.
 */
import 'dart:io';

void main() {
  try {
    stdout.write("Введите число: ");
    int number = int.parse(stdin.readLineSync()!);
    if (number % 2 == 0) {
      stdout.write("Число $number - четное");
    }
    else {
      stdout.write("Число $number - нечетное");
    }
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}