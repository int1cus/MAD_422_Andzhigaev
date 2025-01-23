/*
Задача 16: Количество положительных и отрицательных чисел
Условие:
Пользователь вводит размер массива и его элементы.
Программа должна подсчитать и вывести количество положительных и отрицательных чисел в массиве.
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

    int posCount = 0;
    int negCount = 0;

    for (int number in array) {
      if (number > 0) {
        posCount += 1;
      }
      else if (number < 0) {
        negCount += 1;
      }
    }

    print("Кол-во положительных чисел в массиве: $posCount");
    print("Кол-во отрицательных чисел в массиве: $negCount");
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}