/*
2. Сравнение дат
Задача: Напишите метод, который принимает две даты (LocalDate) и определяет,
какая из них больше, меньше или равна другой. Верните соответствующее сообщение.
*/

void main()
{
  var LocalDate1 = DateTime(2025, 3, 22);
  var LocalDate2 = DateTime(2025, 3, 23);

  print(compareDate(LocalDate1, LocalDate2));
}

String compareDate(DateTime date1, DateTime date2)
{
  if (date1.isAfter(date2)) return "Первая дата позже второй";
  else if (date1.isBefore(date2)) return "Первая дата раньше второй";
  return "Даты совпадают";
}