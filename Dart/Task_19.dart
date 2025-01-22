/*
Задача 19: Перестановка слов в строке
Условие:
Пользователь вводит строку, состоящую из нескольких слов.
Программа должна вывести слова в обратном порядке.
*/
import 'dart:io';

void main() {
  stdout.write("Введите строку со словами через пробел: ");
  String input = stdin.readLineSync()!;

  List<String> words = input.split(' ');

  List<String> reversedWords = words.reversed.toList();

  String result = reversedWords.join(' ');

  stdout.write("Слова в обратном порядке: ");
  print(result);
}
