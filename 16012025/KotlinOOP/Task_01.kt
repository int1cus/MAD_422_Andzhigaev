/*
1. Класс "Человек"
Создайте класс Person с полями name, age, gender.
Реализуйте методы для вывода информации о человеке и
увеличения его возраста. Добавьте метод для изменения имени.
*/

class Person(var name: String, var age: Int, var gender: String) {
    fun printInfo() {
        println("Name: $name, Age: $age, Gender: $gender")
    }

    fun increaseAge(increase: Int) {
        age += increase
    }

    fun changeName(newName: String) {
        name = newName
    }
}

fun main() {
    val person = Person("Alice", 25, "Female")
    person.printInfo()
    person.increaseAge(4)
    person.printInfo()
    person.changeName("Bob")
    person.printInfo()
}
