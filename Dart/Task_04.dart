/*
Задача 4: Сумма чисел от 1 до N
Условие:
Пользователь вводит целое число N. Программа должна вывести сумму всех чисел от 1 до N.
 */
import 'dart:io';

void main() {
  try {
    int sum = 0;
    stdout.write("Введите целое число: ");
    int N = int.parse(stdin.readLineSync()!);
    for (int i = 1; i <= N; i++) {
      sum += i;
    }
    stdout.write("Сумма всех чисел от 1 до $N = $sum");
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число");
  }
}