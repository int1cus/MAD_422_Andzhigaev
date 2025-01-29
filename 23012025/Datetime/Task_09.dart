/*
9. Вычисление возраста по дате рождения
Задача: Напишите метод, который принимает дату рождения в формате
LocalDate и возвращает текущий возраст в годах.
*/

void main()
{
  DateTime date = DateTime.now();
  DateTime birthday = DateTime(1990, 2, 15);

  print("Возраст: ${age(date, birthday)}");
}

int age(DateTime date, DateTime birthday)
{
  int age = date.year - birthday.year;
  if (date.month < birthday.month || (date.month == birthday.month && date.day < birthday.day)) age--;
  return age;
}