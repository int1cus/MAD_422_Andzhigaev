/*
13. Вычисление количества рабочих часов
Задача: Напишите метод, который принимает два объекта LocalDateTime, представляющие
начало и конец рабочего дня, и возвращает количество рабочих часов (без учета выходных).
*/

void main()
{
  DateTime start = DateTime(2025, 1, 23, 8, 0, 0); // 23-01-2025 08:00:00
  DateTime end = DateTime(2025, 1, 23, 20, 0, 0); // 23-01-2025 20:00:00

  print(workHours(start, end));
}

int workHours(DateTime start, DateTime end)
{
  int workHours = end.difference(start).inHours;
  return workHours;
}