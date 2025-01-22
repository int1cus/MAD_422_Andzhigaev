/*
Задача 11: Факториал числа
Условие:
Пользователь вводит целое число N. Программа должна вычислить факториал этого числа (N!).
*/
import 'dart:io';

void main() {
  try {
    int fact = 1;
    stdout.write("Введите целое число: ");
    int N = int.parse(stdin.readLineSync()!);

    if(N < 0) {
      stdout.write("Невозможно вычислить факториал отрицательного числа.");
      return;
    }

    for (int i = 1; i <= N; i++) {
      fact *= i;
    }
    stdout.write("Факториал числа $N = $fact");
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}