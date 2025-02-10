/*
Задание 1: Работа с потоками ввода-вывода
Задача: Напишите программу, которая читает текст из файла и записывает его в другой файл с изменениями:

Программа должна читать содержимое исходного файла построчно.
Преобразовать каждую строку текста в верхний регистр.
Записать преобразованный текст в новый файл.
Условия:

Для работы с файлами использовать классы из пакета java.io: BufferedReader, BufferedWriter,
FileReader, FileWriter.
Программа должна быть устойчивой к ошибкам, например, если файл не найден.
Использовать обработку исключений через try-with-resources.
*/

import 'dart:io';
import 'dart:convert';

void main() async {
  final String inputFile = 'Task_01_input.txt';
  final String outputFile = 'Task_01_output.txt';

  try {
    final input = File(inputFile);
    final output = File(outputFile).openWrite();

    if (!await input.exists()) {
      throw Exception("Файл $inputFile не найден.");
    }

    final lines = input.openRead().transform(utf8.decoder).transform(LineSplitter());

    await for (var line in lines) {
      output.writeln(line.toUpperCase());
    }

    await output.close();
    print("Файл успешно обработан. Результат записан в $outputFile");
  } catch (e) {
    print("Ошибка: $e");
  }
}