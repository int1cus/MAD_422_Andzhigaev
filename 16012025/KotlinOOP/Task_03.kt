/*
3. Полиморфизм: Животные
Создайте интерфейс Animal с методом makeSound(). Реализуйте классы Dog, Cat, и Cow,
которые реализуют этот интерфейс. Продемонстрируйте полиморфизм на примере массива животных.
*/

interface Animal {
    fun makeSound()
}

class Dog : Animal {
    override fun makeSound() {
        println("Гав")
    }
}

class Cat : Animal {
    override fun makeSound() {
        println("Мяу")
    }
}

class Cow : Animal {
    override fun makeSound() {
        println("Муу-у")
    }
}

fun main() {
    val animals: List<Animal> = listOf(Dog(), Cat(), Cow())
    animals.forEach { it.makeSound() }
}
