/*
Задача 15: Сумма всех элементов массива
Условие:
Пользователь вводит размер массива и его элементы.
Программа должна вычислить и вывести сумму всех элементов массива.
*/
import 'dart:io';

void main() {
  try {
    stdout.write("Введите размер массива: ");
    int arrSize = int.parse(stdin.readLineSync()!);
    if(arrSize < 0) {
      stdout.write("Размер массива не может быть отрицательным.");
      return;
    }
    List<int> array = List.filled(arrSize, 0);

    for (int i = 0; i < arrSize; i++) {
      stdout.write("Введите элемент ${i + 1}: ");
      int el = int.parse(stdin.readLineSync()!);
      array[i] = el;
    }
    print("Массив: $array");

    int sum = 0;
    for (int number in array) {
      sum += number;
    }

    stdout.write("Сумма всех элементов массива = $sum");
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}