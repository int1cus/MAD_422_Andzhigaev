/*
Задача 1.
Создание класса базы данных:
Реализуйте класс, который будет представлять подключение к базе данных. Класс должен быть
реализован как Singleton, чтобы при каждом обращении возвращался один и тот же объект.
Требования:
Класс должен быть Singleton.
Метод подключения должен выводить сообщение о создании подключения.
Проверьте, что при создании нескольких экземпляров — они ссылаются на один и тот же объект.
*/
class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();

  factory DatabaseConnection() {
    return _instance;
  }

  DatabaseConnection._internal() {
    print("Подключение к базе данных создано");
  }

  void connect() {
    print("Соединение с базой данных установлено");
  }
}

void main() {
  var db1 = DatabaseConnection();
  var db2 = DatabaseConnection();

  db1.connect();
  db2.connect();

  print(identical(db1, db2));
}




