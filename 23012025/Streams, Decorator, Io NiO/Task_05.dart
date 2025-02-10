/*
Задание 5: Асинхронное чтение файла с использованием NIO.2
Задача: Напишите программу, которая выполняет асинхронное чтение файла с использованием NIO.2.

Используйте классы AsynchronousFileChannel и CompletionHandler.
Программа должна читать файл и выводить его содержимое на консоль по мере чтения.
Условия:

Файл должен считываться асинхронно в отдельном потоке.
Реализуйте CompletionHandler для обработки завершения чтения файла и ошибок.
Критерии:

Правильная работа с асинхронным API.
Асинхронная обработка завершения операции чтения.
*/

import 'dart:io';
import 'dart:convert';

Future<void> readFileAsync(String filePath) async {
  final file = File(filePath);

  if (!await file.exists()) {
    print("Ошибка: Файл $filePath не найден.");
    return;
  }

  try {
    final stream = file.openRead(); // Асинхронное чтение
    await for (var line in stream.transform(utf8.decoder).transform(LineSplitter())) {
      for (var char in line.split('')) {
        stdout.write(char);
        await Future.delayed(Duration(milliseconds: 50));
      }
      stdout.writeln();
    }
    print("Чтение файла завершено.");
  } catch (e) {
    print("Ошибка при чтении файла: $e");
  }
}

void main() async {
  const filePath = 'Task_05.txt';
  print("Начинаем асинхронное чтение файла...");
  await readFileAsync(filePath);
}
