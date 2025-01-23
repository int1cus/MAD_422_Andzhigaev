/*
Задача 7: Обратный порядок чисел
Условие:
Пользователь вводит целое число N.
Программа должна вывести числа от N до 1 в обратном порядке.
 */
import 'dart:io';

void main() {
  try {
    stdout.write("Введите целое число: ");
    int N = int.parse(stdin.readLineSync()!);
    if (N < 1) {
      stdout.write("Введите число большее или равное 1");
      return;
    }
    for (int i = N; i >= 1; i--) {
      stdout.write("$i ");
    }
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}