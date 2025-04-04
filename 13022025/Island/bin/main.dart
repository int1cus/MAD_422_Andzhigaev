import 'dart:io';
import '../lib/island_simulation.dart';

void main() async {
  IslandSimulation island = IslandSimulation();

  island.randomFill();
  island.start();

  await stdin.first;
  island.stop();
  print("Симуляция завершена.");
  print("Логи были записаны в файл: ${island.logFilePath}");
}
