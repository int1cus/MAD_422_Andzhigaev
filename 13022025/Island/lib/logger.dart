import 'dart:io';

class Logger {
  final String logFilePath;
  late final File logFile;

  Logger(this.logFilePath) {
    logFile = File(logFilePath)..createSync(recursive: true);
  }

  void logAction(String message) {
    logFile.writeAsStringSync("${DateTime.now()}: $message\n", mode: FileMode.append);
  }
}