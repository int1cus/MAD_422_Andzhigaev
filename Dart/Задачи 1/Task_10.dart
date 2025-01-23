 /*
 Задача 10: Количество цифр в числе
Условие:
Пользователь вводит целое число. Программа должна вывести количество цифр в этом числе.
*/
 import 'dart:io';

 void main() {
   try {
     int digitCount = 0;
     stdout.write("Введите целое число: ");
     int N = int.parse(stdin.readLineSync()!);
     if (N == 0) {
       stdout.write("Количество цифр в числе 0: 1");
       return;
     }
     int tmp = N;
     while (tmp != 0) {
       tmp ~/= 10;
       digitCount += 1;
     }
     
     stdout.write("Количество цифр в числе $N: $digitCount");
   }
   catch (e) {
     stdout.write("Ошибка ввода! Введите целое число.");
   }
 }