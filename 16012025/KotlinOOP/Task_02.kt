/*
2. Наследование: Класс "Работник" и "Менеджер"
Создайте класс Worker, который наследуется от класса Person, и добавьте поле salary.
Создайте класс Manager, который наследует от Worker и добавляет поле для подчиненных сотрудников.
*/

open class Person(val name: String, var age: Int, val gender: String) {
    fun printInfo() {
        println("Имя: $name, Возраст: $age, Пол: $gender")
    }

    fun increaseAge() {
        age++
    }

    fun changeName(newName: String) {
        println("Имя изменено с $name на $newName")
    }
}

open class Worker(name: String, age: Int, gender: String, var salary: Double) : Person(name, age, gender) {
    fun printWorkerInfo() {
        println("Сотрудник: $name, Возраст: $age, Пол: $gender, Зарплата: $salary")
    }
}

class Manager(
    name: String,
    age: Int,
    gender: String,
    salary: Double,
    val subordinates: MutableList<Worker>
) : Worker(name, age, gender, salary) {
    fun printManagerInfo() {
        println("Менеджер: $name, Возраст: $age, Пол: $gender, Зарплата: $salary")
        println("Подчиненные: ${subordinates.joinToString { it.name }}")
    }

    fun addSubordinate(worker: Worker) {
        subordinates.add(worker)
        println("Добавлен подчиненный: ${worker.name}")
    }

    fun removeSubordinate(worker: Worker) {
        if (subordinates.remove(worker)) {
            println("Удален подчиненный: ${worker.name}")
        } else {
            println("Сотрудник ${worker.name} не найден среди подчиненных.")
        }
    }
}

fun main() {
    val worker1 = Worker("Васян", 30, "М", 50000.0)
    val worker2 = Worker("Санек", 28, "М", 55000.0)
    worker1.printWorkerInfo()
    worker2.printWorkerInfo()

    val manager = Manager("Хочушка Людмила", 40, "Ж", 80000.0, mutableListOf())
    manager.printManagerInfo()

    manager.addSubordinate(worker1)
    manager.addSubordinate(worker2)
    manager.printManagerInfo()

    manager.removeSubordinate(worker1)
    manager.printManagerInfo()
}
