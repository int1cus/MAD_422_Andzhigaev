/*
15. Определение дня недели по дате
Задача: Напишите метод, который принимает дату и возвращает название дня недели на русском языке.
*/

void main()
{
  DateTime date = DateTime.now();

  print("${getWeekday(date)}");
}

String getWeekday(DateTime date)
{
  List<String> days = ["", "Понедельник", "Вторник", "Среда", "Четверг",
    "Пятница", "Суббота", "Воскресенье"];

  return days[date.weekday];
}