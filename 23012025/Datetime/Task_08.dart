/*
8. Конвертация между часовыми поясами
Задача: Напишите метод, который принимает дату и время в часовом поясе UTC и
конвертирует его в другой часовой пояс, например, Europe/Moscow.
*/

void main()
{
  DateTime date = DateTime.now();
  print(date);
  print(convertTimezone(date, 3, -8)); // Москва -> Лос-Анджелес
}

DateTime convertTimezone(DateTime date, timezoneFrom, timezoneTo)
{
  date = date.add(Duration(hours: timezoneTo - timezoneFrom));
  return date;
}