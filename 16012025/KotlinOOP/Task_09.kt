/*
9. Наследование: Животные и их движения
Создайте класс Animal с методом move(). Реализуйте классы Fish, Bird и Dog,
которые наследуют Animal и переопределяют метод move() (рыба плавает, птица летает, собака бегает).
*/

open class Animal {
    open fun move() {
        println("Животное двигается.")
    }
}

class Fish : Animal() {
    override fun move() {
        println("Рыба плавает.")
    }
}

class Bird : Animal() {
    override fun move() {
        println("Птица летает.")
    }
}

class Dog : Animal() {
    override fun move() {
        println("Собака бегает.")
    }
}

fun main() {
    val fish = Fish()
    val bird = Bird()
    val dog = Dog()

    fish.move()
    bird.move()
    dog.move()
}
