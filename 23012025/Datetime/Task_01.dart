/*
1. Основы LocalDate и LocalTime
Задача: Напишите программу, которая:

Создает объект LocalDate, представляющий текущую дату.
Создает объект LocalTime, представляющий текущее время.
Выводит их значения в формате dd-MM-yyyy HH:mm:ss
*/

void main()
{
    var LocalDate = DateTime.now();
    var LocalTime = DateTime.now();

    print("Текущая дата: ${format(LocalDate.day)}-${format(LocalDate.month)}-${format(LocalDate.year)} "
        "${format(LocalTime.hour)}:${format(LocalTime.minute)}:${format(LocalTime.second)}");
}

String format(int number) {
  if (number < 10) return '0$number';
  return '$number';
}
