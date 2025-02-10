/*
Задание 4: Программа с использованием Java NIO
Задача: Напишите программу, которая копирует файл с использованием Java NIO.

Использовать FileChannel для чтения и записи данных.
Программа должна поддерживать возможность копирования больших файлов (> 1 Гб).
Реализовать обработку исключений, связанных с доступом к файлу или его отсутствием.
Условия:

Используйте методы transferTo() или transferFrom() из FileChannel для копирования содержимого.
Программа должна быть устойчива к прерыванию работы и сообщать об ошибках.
Критерии:

Корректная работа с большими файлами.
Использование механизмов NIO и сравнение производительности с классическим IO (опционально).
*/

import 'dart:io';

Future<void> copyFile(String sourcePath, String destinationPath) async {
  try {
    final sourceFile = File(sourcePath);
    final destinationFile = File(destinationPath);

    if (!await sourceFile.exists()) {
      throw Exception("Файл $sourcePath не найден.");
    }

    await sourceFile.copy(destinationPath);
    print("Файл успешно скопирован в $destinationPath");
  } catch (e) {
    print("Ошибка: $e");
  }
}

void main() async {
  const source = 'Task_04_input.txt';
  const destination = 'Task_04_output.txt';

  print("Копируем файл...");
  await copyFile(source, destination);
}