import 'dart:io';
import 'dart:convert';

const String alphabet = 'АБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
const int alphabetSize = alphabet.length;

String caesarEncrypt(String text, int shift) {
  shift = shift % alphabetSize;

  return text.split('').map((char) {
    int index = alphabet.indexOf(char.toUpperCase());
    if (index == -1) return char;

    int newIndex = (index + shift) % alphabetSize;
    return char == char.toLowerCase()
        ? alphabet[newIndex].toLowerCase()
        : alphabet[newIndex];
  }).join('');
}

String caesarDecrypt(String text, int shift) {
  return caesarEncrypt(text, -shift);
}

Future<void> bruteForceDecrypt(String filePath) async {
  File file = File(filePath);
  if (!await file.exists()) {
    print("Файл не найден!");
    return;
  }

  String content = await file.readAsString(encoding: utf8);
  for (int shift = 1; shift < alphabetSize; shift++) {
    print("Сдвиг $shift:");
    print(caesarDecrypt(content, shift));
    print("—" * 30);
  }
}

Future<void> frequencyAnalysisDecrypt(String filePath) async {
  File file = File(filePath);
  if (!await file.exists()) {
    print("Файл не найден!");
    return;
  }

  String content = await file.readAsString(encoding: utf8);
  Map<String, int> freq = {};

  for (var char in content.toUpperCase().split('')) {
    if (alphabet.contains(char)) {
      freq[char] = (freq[char] ?? 0) + 1;
    }
  }

  if (freq.isEmpty) {
    print("Не удалось выполнить анализ.");
    return;
  }

  String mostCommonChar = freq.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  int shift = (alphabet.indexOf(mostCommonChar) - alphabet.indexOf('О')) % alphabetSize;
  print("Предполагаемый сдвиг: $shift");
  print("Расшифрованный текст:");
  print(caesarDecrypt(content, shift));
}

Future<void> processFile(String inputPath, String outputPath, Function(String) processor) async {
  File inputFile = File(inputPath);
  if (!await inputFile.exists()) {
    print("Ошибка: Файл не найден!");
    return;
  }

  String content = await inputFile.readAsString(encoding: utf8);
  String processedContent = processor(content);

  File outputFile = File(outputPath);
  await outputFile.writeAsString(processedContent, encoding: utf8);
  print("Готово! Результат записан в $outputPath");
}

void main() async {
  while (true) {
    print("Выберите режим работы:");
    print("1 - Шифрование");
    print("2 - Расшифровка с ключом");
    print("3 - Взлом (brute force)");
    print("4 - Взлом (статистический анализ)");
    print("0 - Выход");

    String? choice = stdin.readLineSync();
    if (choice == "0") break;

    print("Введите путь к входному файлу:");
    String? inputPath = stdin.readLineSync();

    if (inputPath == null || inputPath.isEmpty) {
      print("Ошибка: Некорректный путь.");
      continue;
    }

    if (choice == "1" || choice == "2") {
      print("Введите сдвиг (ключ):");
      String? shiftStr = stdin.readLineSync();
      int? shift = int.tryParse(shiftStr ?? '');

      if (shift == null || shift < 0) {
        print("Ошибка: Ключ должен быть положительным числом.");
        continue;
      }

      print("Введите путь для сохранения результата:");
      String? outputPath = stdin.readLineSync();

      if (outputPath == null || outputPath.isEmpty) {
        print("Ошибка: Некорректный путь.");
        continue;
      }

      if (choice == "1") {
        await processFile(inputPath, outputPath, (text) => caesarEncrypt(text, shift));
      } else {
        await processFile(inputPath, outputPath, (text) => caesarDecrypt(text, shift));
      }
    } else if (choice == "3") {
      await bruteForceDecrypt(inputPath);
    } else if (choice == "4") {
      await frequencyAnalysisDecrypt(inputPath);
    } else {
      print("Ошибка: Некорректный выбор.");
    }
  }
}