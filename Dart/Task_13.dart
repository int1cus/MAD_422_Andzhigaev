/*
Задача 13: Палиндром
Условие:
Пользователь вводит строку. Программа должна проверить, является ли эта
строка палиндромом (читается одинаково слева направо и справа налево).
*/
import 'dart:io';

void main() {
  stdout.write("Введите строку: ");
  String text = stdin.readLineSync()!;
  String reverse = '';

  for (int i = text.length - 1; i >= 0; i--) {
    reverse += text[i];
  }

  if (text == reverse) {
    stdout.write("Строка явлется палиндромом.");
  }
  else {
    stdout.write("Строка не является палиндромом.");
  }
}