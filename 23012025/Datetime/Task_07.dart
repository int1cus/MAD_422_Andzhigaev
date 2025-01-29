/*
7. Форматирование и парсинг даты
Задача: Напишите программу, которая принимает строку даты в формате dd-MM-yyyy,
конвертирует ее в объект LocalDate, добавляет к ней 10 дней и выводит результат
в формате yyyy/MM/dd.
*/

void main()
{
  String date = "29-12-2024";

  DateTime convertedDate = DateTime.parse(toISO(date));
  convertedDate = convertedDate.add(Duration(days: 10));

  print("${format(convertedDate.year)}/${format(convertedDate.month)}/${format(convertedDate.day)}");
}

String toISO(date)
{
  List<String> parts = date.split('-');
  String formattedDate = '${parts[2]}-${parts[1]}-${parts[0]}';
  return formattedDate;
}

String format(int number) {
  if (number < 10) return '0$number';
  return '$number';
}