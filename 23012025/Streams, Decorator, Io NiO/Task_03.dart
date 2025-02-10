/*
Задание 3: Сравнение производительности IO и NIO
Задача: Напишите программу, которая читает большой текстовый файл
(например, несколько мегабайт) двумя способами:

С использованием стандартных классов IO (FileReader и BufferedReader).
С использованием NIO (классы FileChannel, ByteBuffer, Files).
Условия:

Измерьте время выполнения каждой операции (чтение и запись файла).
Выведите результаты на консоль для сравнения производительности.
Критерии:

Программа должна читать файл целиком и записывать его в другой файл.
Время выполнения каждого метода должно быть замерено с помощью
System.currentTimeMillis() или System.nanoTime().
Сделайте выводы на основе полученных данных: какой метод быстрее для больших файлов и почему.
*/

import 'dart:io';
import 'dart:convert';

Future<void> measureIO(String inputFile, String outputFile) async {
  final stopwatch = Stopwatch()..start();
  final input = File(inputFile);
  final output = File(outputFile).openWrite();

  final lines = input.openRead().transform(utf8.decoder).transform(LineSplitter());

  await for (var line in lines) {
    output.writeln(line);
  }

  await output.close();
  stopwatch.stop();
  print("IO: ${stopwatch.elapsedMilliseconds} ms");
}

Future<void> measureNIO(String inputFile, String outputFile) async {
  final stopwatch = Stopwatch()..start();
  final input = await File(inputFile).readAsBytes();
  await File(outputFile).writeAsBytes(input);
  stopwatch.stop();
  print("NIO: ${stopwatch.elapsedMilliseconds} ms");
}

void main() async {
  const inputFile = 'Task_03_input.txt';
  const outputFileIO = 'Task_03_output_io.txt';
  const outputFileNIO = 'Task_03_output_nio.txt';

  print("Читаем и записываем файл с использованием IO...");
  await measureIO(inputFile, outputFileIO);

  print("Читаем и записываем файл с использованием NIO...");
  await measureNIO(inputFile, outputFileNIO);
}