/*
11. Генерация случайной даты в диапазоне
Задача: Реализуйте метод, который принимает две даты и генерирует случайную дату в этом диапазоне.
*/

import 'dart:math';

void main()
{
  DateTime date1 = DateTime(1900, 1, 1);
  DateTime date2 = DateTime.now();

  print("${randomDate(date1, date2)}");
}

DateTime randomDate(DateTime date1, DateTime date2)
{
  Random random = Random();
  int daysDiff = date2.difference(date1).inDays;
  int daysRandom = random.nextInt(daysDiff);
  return date1.add(Duration(days: daysRandom));
}