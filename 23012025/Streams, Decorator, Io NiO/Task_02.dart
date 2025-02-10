/*
Задание 2: Реализация паттерна Декоратор
Задача: Реализуйте паттерн Декоратор для обработки текста. Напишите набор классов,
которые будут декорировать строку:

Основной интерфейс TextProcessor, содержащий метод process(String text).
Реализуйте класс SimpleTextProcessor, который просто возвращает текст без изменений.
Реализуйте декораторы:
UpperCaseDecorator — преобразует текст в верхний регистр.
TrimDecorator — удаляет пробелы в начале и конце строки.
ReplaceDecorator — заменяет все пробелы символом подчеркивания (_).
Условия:

Продемонстрируйте работу декораторов, комбинируя их.
Пример использования: оберните текст в несколько декораторов и вызовите process.
*/

abstract class TextProcessor {
  String process(String text);
}

class SimpleTextProcessor implements TextProcessor {
  @override
  String process(String text) => text;
}

class UpperCaseDecorator implements TextProcessor {
  final TextProcessor _processor;

  UpperCaseDecorator(this._processor);

  @override
  String process(String text) => _processor.process(text).toUpperCase();
}

class TrimDecorator implements TextProcessor {
  final TextProcessor _processor;

  TrimDecorator(this._processor);

  @override
  String process(String text) => _processor.process(text).trim();
}

class ReplaceDecorator implements TextProcessor {
  final TextProcessor _processor;

  ReplaceDecorator(this._processor);

  @override
  String process(String text) => _processor.process(text).replaceAll(' ', '_');
}

void main() {
  TextProcessor processor = SimpleTextProcessor();
  processor = UpperCaseDecorator(processor);
  processor = TrimDecorator(processor);
  processor = ReplaceDecorator(processor);

  String text = "рыбалка смерти 2007";
  print(processor.process(text));
}
