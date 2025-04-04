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
  final double maxFood;
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
    required double maxFood,
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
    required double maxFood,
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