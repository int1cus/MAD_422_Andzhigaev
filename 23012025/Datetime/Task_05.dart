/*
5. Подсчет выходных за месяц
Задача: Напишите метод, который принимает месяц и год и возвращает
количество выходных (суббот и воскресений) в этом месяце.
*/

void main()
{
  var year = DateTime.now().year;
  var month = DateTime.now().month;

  print("Количество выходных в месяце: ${getWeekends(year, month)}");
}

int getWeekends(year, month)
{
  DateTime thisMonth = DateTime(year, month, 1);
  DateTime nextMonth = DateTime(year, month + 1, 1);
  int daysInMonth = nextMonth.difference(thisMonth).inDays;
  int weekends = 0;
  for (int day = 1; day < daysInMonth; day++)
  {
    if (DateTime(year, month, day).weekday >= 6)
    {
      weekends++;
    }
  }
  return weekends;
}