/*
10. Работа с коллекциями: Университет
Создайте класс Student с полями name, group, grade. Создайте класс University,
который содержит список студентов и методы для добавления студентов, сортировки
по имени и фильтрации по успеваемости.
*/

data class Student(val name: String, val group: String, val grade: Double)

class University {
    private val students = mutableListOf<Student>()

    fun addStudent(student: Student) {
        students.add(student)
    }

    fun sortByName(): List<Student> {
        return students.sortedBy { it.name }
    }

    fun filterByGrade(minGrade: Double): List<Student> {
        return students.filter { it.grade >= minGrade }
    }
}

fun main() {
    val university = University()
    university.addStudent(Student("Гриша", "РПП-4", 4.5))
    university.addStudent(Student("Ким Петрас", "РПП-7", 3.7))
    university.addStudent(Student("Чарли хсх", "СКСЛГ-2", 4.8))

    println("Студенты отсортированные по имени:")
    university.sortByName().forEach { println(it) }

    println("Студенты со средним баллом 4.0+:")
    university.filterByGrade(4.0).forEach { println(it) }
}

