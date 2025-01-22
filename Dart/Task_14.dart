/*
Задача 14: Найти максимальное число в массиве
Условие:
Пользователь вводит размер массива и элементы массива.
Программа должна найти и вывести максимальное число в массиве.
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

    int max = array[0];
    for (int number in array) {
      if (number > max) {
        max = number;
      }
    }
    stdout.write("Максимальный элемент массива: $max");
  }
  catch (e) {
    stdout.write("Ошибка ввода! Введите целое число.");
  }
}