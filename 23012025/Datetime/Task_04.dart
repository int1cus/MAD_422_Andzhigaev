/*
4. Проверка високосного года
Задача: Реализуйте метод, который принимает год и возвращает true,
если он является високосным, и false в противном случае.
*/

void main()
{
  var date = DateTime(2000);
  print(isLeapYear(date.year));
}

bool isLeapYear(int year)
{
  if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) return true;
  return false;
}