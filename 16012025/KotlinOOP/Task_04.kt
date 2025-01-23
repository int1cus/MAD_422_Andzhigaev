/*
4. Абстрактный класс "Транспорт"
Создайте абстрактный класс Transport с абстрактным методом move().
Реализуйте классы Car и Bike, которые наследуются от Transport и реализуют метод move().
*/

abstract class Transport {
    abstract fun move()
}

class Car : Transport() {
    override fun move() {
        println("Едет автомобиль.")
    }
}

class Bike : Transport() {
    override fun move() {
        println("Едет байк.")
    }
}

fun main() {
    val car = Car()
    val bike = Bike()

    car.move()
    bike.move()
}
