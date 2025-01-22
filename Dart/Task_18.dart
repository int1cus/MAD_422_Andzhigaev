/*
Задача 18: Подсчет гласных и согласных в строке
Условие:
Пользователь вводит строку. Программа должна подсчитать
и вывести количество гласных и согласных букв в этой строке.
*/
import 'dart:ffi';
import 'dart:io';

void main() {
  stdout.write("Введите строку: ");
  String text = stdin.readLineSync()!;
  String vowels = "AaEeIiOoUu";
  String alphabet = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz";

  int vowelCount = 0;
  int consonantCount = 0;

  for(int i = 0;  i < text.length; i++) {
    String char = text[i];
    if (vowels.contains(char)) {
      vowelCount += 1;
    }
    else if (alphabet.contains(char)) {
      consonantCount += 1;
    }
  }

  print("Кол-во гласных: $vowelCount");
  print("Кол-во согласных: $consonantCount");
}