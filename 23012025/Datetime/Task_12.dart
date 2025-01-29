/*
12. Расчет времени до заданной даты
Задача: Создайте метод, который принимает дату и время события и рассчитывает,
сколько часов, минут и секунд осталось до него от текущего момента.
*/

void main()
{
  DateTime currentDate = DateTime.now();
  DateTime event = DateTime(2050, 3, 12);

  untilEvent(currentDate, event);
}

void untilEvent(DateTime currentDate, DateTime event)
{
  int secDiff = event.difference(currentDate).inSeconds;

  print("До события осталось ${secDiff ~/ 3600} ч, ${secDiff ~/ 60} мин, $secDiff с");
}