/*
Задача 8: Сумма четных чисел
Условие:
Пользователь вводит два целых числа A и B.
Программа должна найти сумму всех четных чисел в диапазоне от A до B (включительно).
*/
import 'dart:io';

void main() {
  try {
    stdout.write("Введите целое число А: ");
    int A = int.parse(stdin.readLineSync()!);

    stdout.write("Введите целое число B: ");
    int B = int.parse(stdin.readLineSync()!);

    List<int> evenNumSums = [];

    for (int i = A; i <= B; i++) {
      for (int j = A; j <= B; j++) {
        if (i % 2 == 0 && j % 2 == 0 && !evenNumSums.contains(i + j)) {
          evenNumSums.add(i + j);
        }
      }
    }
    print(evenNumSums);
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}