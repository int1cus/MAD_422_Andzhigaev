/*
Задача 2: Минимальное из трех чисел
Условие:
Пользователь вводит три целых числа. Программа должна найти и вывести минимальное из них.
 */
import 'dart:io';

void main() {
  try {
    List<int> numbers = [];
    for (int i = 0; i < 3; i++) {
      print("Введите число ${i + 1}: ");
      numbers.add(int.parse(stdin.readLineSync()!));
    }

    int min = numbers[0];
    for (int number in numbers) {
      if (number < min) {
        min = number;
      }
    }

    stdout.write("Минимальное из трех чисел: $min");
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}