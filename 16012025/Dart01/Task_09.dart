/*
Задача 9: Реверс строки
Условие:
Пользователь вводит строку. Программа должна вывести эту строку в обратном порядке.
*/
import 'dart:io';

void main() {
  String reversed = '';
  stdout.write("Введите текст: ");
  String text = stdin.readLineSync()!;
  for (int i = text.length - 1; i >= 0; i--) {
    reversed += text[i];
  }

  stdout.write(reversed);
}
