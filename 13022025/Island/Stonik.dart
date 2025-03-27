import 'dart:async';
import 'dart:io';
import 'dart:math';

class AnimalParams {
  final double weight;
  final int maxInCell;
  final int moveSpeed;
  final double foodRequired;

  AnimalParams({
    required this.weight,
    required this.maxInCell,
    required this.moveSpeed,
    required this.foodRequired,
  });
}

abstract class Animal {
  final String species;
  final int maxFood;
  int hunger = 0;
  int x, y;
  final String symbol;
  bool isAlive = true;
  int lastReproductionStep = -1;
  bool canReproduce = true;

  Animal({
    required this.species,
    required this.maxFood,
    required this.x,
    required this.y,
    required this.symbol,
  });

  void move(int width, int height) {
    Random rand = Random();
    int dx = rand.nextInt(3) - 1;
    int dy = rand.nextInt(3) - 1;
    x = (x + dx + width) % width;
    y = (y + dy + height) % height;
  }

  void eat() {
    hunger = 0;
  }

  bool growOlder() {
    hunger++;
    if (hunger > 20) {
      isAlive = false;
      return true;
    }
    return false;
  }

  Animal clone();

  bool canReproduceNow(int currentStep) {
    if (!canReproduce) return false;
    return currentStep - lastReproductionStep >= 5;
  }

  void reproduce(int currentStep) {
    lastReproductionStep = currentStep;
    canReproduce = false;
  }
}

class Carnivore extends Animal {
  Carnivore({
    required String species,
    required int maxFood,
    required int x,
    required int y,
    required String symbol,
  }) : super(species: species, maxFood: maxFood, x: x, y: y, symbol: symbol);

  @override
  void eat() {
    super.eat();
  }

  @override
  Animal clone() {
    return Carnivore(
      species: species,
      maxFood: maxFood,
      x: x,
      y: y,
      symbol: symbol,
    );
  }
}

class Herbivore extends Animal {
  Herbivore({
    required String species,
    required int maxFood,
    required int x,
    required int y,
    required String symbol,
  }) : super(species: species, maxFood: maxFood, x: x, y: y, symbol: symbol);

  @override
  void eat() {
    super.eat();
  }

  @override
  Animal clone() {
    return Herbivore(
      species: species,
      maxFood: maxFood,
      x: x,
      y: y,
      symbol: symbol,
    );
  }
}

class Plant {
  final String symbol;
  int x, y;

  Plant({required this.symbol, required this.x, required this.y});
}

class IslandSimulation {
  final int width = 20;
  final int height = 20;
  late List<List<String>> grid;
  late List<Animal> animals;
  late List<Plant> plants;
  int step = 0;
  late Timer timer;
  final Random random = Random();
  final int reproductionHungerThreshold = 15;

  final String logFilePath = "Logs/Log_${DateTime.now().toString().replaceAll(RegExp(r'[:\-]'), '_')}.txt";
  late File logFile;
  bool isSimulationRunning = true;

  IslandSimulation() {
    grid = List.generate(height, (_) => List.filled(width, ' '));
    animals = [];
    plants = [];
    logFile = File(logFilePath)..createSync(recursive: true);
  }

  void randomFill() {
    for (int i = 0; i < 50; i++) {
      animals.add(Carnivore(species: 'Волк', maxFood: 8, x: random.nextInt(width), y: random.nextInt(height), symbol: '🐺'));
    }
    for (int i = 0; i < 100; i++) {
      animals.add(Herbivore(species: 'Олень', maxFood: 50, x: random.nextInt(width), y: random.nextInt(height), symbol: '🦌'));
    }
    for (int i = 0; i < 200; i++) {
      plants.add(Plant(symbol: '🌱', x: random.nextInt(width), y: random.nextInt(height)));
    }
  }

  bool isSimulationOver() {
    return animals.every((animal) => !animal.isAlive);
  }

  Future<void> checkForFoodAndReproduction() async {
    List<Animal> animalsToRemove = [];
    List<Plant> plantsToRemove = [];
    List<Animal> animalsToAdd = [];


    for (var animal in animals) {
      if (animal is Herbivore) {
        for (var plant in plants) {
          if ((animal.x - plant.x).abs() <= 1 && (animal.y - plant.y).abs() <= 1) {
            if (random.nextDouble() < 0.5) {
              animal.eat();
              plantsToRemove.add(plant);
              logAction("${animal.species} (${animal.x}, ${animal.y}) съел растение на (${plant.x}, ${plant.y}). Голод: ${animal.hunger}");
              break;
            }
          }
        }
      }

      if (animal is Carnivore) {
        for (var prey in animals) {
          if ((animal.x - prey.x).abs() <= 1 && (animal.y - prey.y).abs() <= 1 && prey is Herbivore) {
            if (random.nextDouble() < 0.5) {
              animal.eat();
              animalsToRemove.add(prey);
              logAction("${animal.species} (${animal.x}, ${animal.y}) съел ${prey.species} на (${prey.x}, ${prey.y}). Голод: ${animal.hunger}");
              break;
            }
          }
        }
      }

      // Размножение
      for (var other in animals) {
        if (animal.species == other.species && animal != other && animal.isAlive && other.isAlive) {
          if ((animal.x - other.x).abs() <= 1 && (animal.y - other.y).abs() <= 1) {
            if (animal.hunger <= reproductionHungerThreshold && other.hunger <= reproductionHungerThreshold && animal.canReproduceNow(step) && other.canReproduceNow(step)) {
              var newAnimal = animal.clone();
              newAnimal.x = (animal.x + other.x) ~/ 2;
              newAnimal.y = (animal.y + other.y) ~/ 2;
              animalsToAdd.add(newAnimal);
              animal.reproduce(step);
              other.reproduce(step);
              logAction("${animal.species} (${animal.x}, ${animal.y}) и ${other.species} (${other.x}, ${other.y}) размножились. Новый детеныш на (${newAnimal.x}, ${newAnimal.y})");
              break;
            }
          }
        }
      }
    }

    // Логирование смерти животных от голода
    for (var animal in animals) {
      if (animal.growOlder()) {
        logAction("${animal.species} умер от голода на (${animal.x}, ${animal.y}).");
        animalsToRemove.add(animal); // Добавляем на удаление
      }
    }

    for (var animal in animalsToRemove) {
      animals.remove(animal); // Удаляем животных
    }
    for (var plant in plantsToRemove) {
      plants.remove(plant); // Удаляем растения
    }
    animals.addAll(animalsToAdd); // Добавляем новых детенышей
  }



  void updateGrid() {
    Map<String, dynamic> cellMap = {};

    for (Animal animal in animals) {
      if (!animal.isAlive) continue;
      String key = "${animal.x},${animal.y}";
      if (!cellMap.containsKey(key)) {
        cellMap[key] = animal;
      }
    }

    for (Plant plant in plants) {
      String key = "${plant.x},${plant.y}";
      cellMap[key] = plant;
    }

    animals = cellMap.values.whereType<Animal>().toList();
    plants = cellMap.values.whereType<Plant>().toList();

    for (int r = 0; r < height; r++) {
      for (int c = 0; c < width; c++) {
        String key = "$c,$r";
        if (cellMap[key] is Animal && (cellMap[key] as Animal).isAlive) {
          grid[r][c] = (cellMap[key] as Animal).symbol;
        } else if (cellMap[key] is Plant) {
          grid[r][c] = (cellMap[key] as Plant).symbol;
        } else {
          grid[r][c] = ' ';
        }
      }
    }
  }

  void simulateStep() {
    step++;
    List<Animal> currentAnimals = List.from(animals);

    Future.wait([checkForFoodAndReproduction()]);

    for (var animal in currentAnimals) {
      var oldX = animal.x;
      var oldY = animal.y;

      animal.move(width, height);
      if (oldX != animal.x || oldY != animal.y) {
        logAction("${animal.species} переместился с ($oldX, $oldY) в (${animal.x}, ${animal.y}). Голод: ${animal.hunger}");
      }

      // if (random.nextDouble() < 0.5) {
      //   animal.eat();
      //   logAction("${animal.species} поел. Голод: ${animal.hunger}");
      // }

      if (animal.growOlder()) {
        animals.remove(animal);
      }
    }

    updateGrid();
    printIsland();

    if (isSimulationOver()) {
      stop();
      print("Нажмите Enter, чтобы продолжить..");
    }
  }

  void logAction(String message) {
    logFile.writeAsStringSync("${DateTime.now()}: $message\n", mode: FileMode.append);
  }

  void start() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      simulateStep();
    });
  }

  void stop() {
    timer.cancel();
    isSimulationRunning = false;
  }

  void printIsland() {
    String border = '+' + '-' * width + '+';
    print(border);

    for (var row in grid) {
      print('|' + row.join(' ') + '');
    }

    print(border);
    print("\n\n\n");
  }
}

void main() async {
  IslandSimulation island = IslandSimulation();

  island.randomFill();
  island.start();

  await stdin.first;
  island.stop();
  print("Симуляция завершена.");
  print("Логи были записаны в файл: ${island.logFilePath}");
}
