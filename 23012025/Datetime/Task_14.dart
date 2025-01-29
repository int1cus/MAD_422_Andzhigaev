/*
14. Конвертация даты в строку с учетом локали
Задача: Создайте метод, который принимает объект LocalDate и выводит его в
строковом формате с учетом локали, например, ru или en.
*/

void main()
{
  DateTime date = DateTime.now();

  print(formatDate(date, "ru"));
  print(formatDate(date, "en"));
}

String formatDate(DateTime date, String locale) {
  List<String> monthsRu = [
    "января", "февраля", "марта", "апреля", "мая", "июня",
    "июля", "августа", "сентября", "октября", "ноября", "декабря"
  ];

  List<String> monthsEn = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
  ];

  List<String> months;

  if (locale == "ru") {
    months = monthsRu;
  } else {
    months = monthsEn;
  }

  return "${date.day} ${months[date.month - 1]} ${date.year}";
}