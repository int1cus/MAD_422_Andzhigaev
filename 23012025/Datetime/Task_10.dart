/*
10. Создание календаря на месяц
Задача: Напишите метод, который принимает месяц и год и выводит все даты месяца
с указанием, является ли каждая из них рабочим днем или выходным.
*/

void main()
{
  markWeekday(2000, 2);
}

void markWeekday(int year, int month)
{
  List<String> days = ["", "Понедельник", "Вторник", "Среда", "Четверг",
    "Пятница", "Суббота", "Воскресенье"];

  DateTime date = DateTime(year, month);
  int daysInMonth = DateTime(year, month + 1, 0).day;

  for (int day = 1; day <= daysInMonth; day++)
  {
    DateTime date = DateTime(year, month, day);
    if (date.weekday >= 6) print("${date} - ${days[date.weekday]} - выходной");
    else print("${date} - ${days[date.weekday]} - рабочий день");
  }
}