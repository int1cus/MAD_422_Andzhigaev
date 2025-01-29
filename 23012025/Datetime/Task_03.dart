/*
3. Сколько дней до Нового года?
Задача: Создайте метод, который определяет количество дней до Нового года от текущей даты.
*/

void main()
{
  var currentDate = DateTime(DateTime.now().year, 1, 1);

  print("Дней до нового года: ${daysUntilNewYear(currentDate)}");
}

int daysUntilNewYear(DateTime currentDate)
{
  DateTime thisNewYear = DateTime(currentDate.year, 1, 1);
  Duration difference = currentDate.difference(thisNewYear);
  if (!isLeapYear(currentDate.year)) return 365 - difference.inDays;
  return 366 - difference.inDays;
}

bool isLeapYear(int year)
{
  if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) return true;
  return false;
}