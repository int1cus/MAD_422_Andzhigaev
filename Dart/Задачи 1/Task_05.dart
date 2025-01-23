/*
Задача 5: Число Фибоначчи
Условие:
Пользователь вводит целое число N. Программа должна вывести первые N чисел Фибоначчи.
 */
import 'dart:io';

void main() {
  try {
    int a = 0;
    int b = 1;
    stdout.write("Введите целое число: ");
    int N = int.parse(stdin.readLineSync()!);
    for (int i = 1; i <= N; i++) {
      int c = a + b;
      stdout.write("$c ");
      a = b;
      b = c;
    }
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}