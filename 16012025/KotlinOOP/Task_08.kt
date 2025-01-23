/*
8. Площадь фигур
Создайте абстрактный класс Shape с абстрактным методом getArea().
Реализуйте классы Circle и Rectangle, которые наследуют от Shape и
вычисляют площадь круга и прямоугольника соответственно.
*/

abstract class Shape {
    abstract fun getArea(): Double
}

class Circle(private val radius: Double) : Shape() {
    override fun getArea(): Double {
        return Math.PI * radius * radius
    }
}

class Rectangle(private val width: Double, private val height: Double) : Shape() {
    override fun getArea(): Double {
        return width * height
    }
}

fun main() {
    val circle = Circle(5.0)
    println("Площадь круга: ${circle.getArea()}")

    val rectangle = Rectangle(4.0, 6.0)
    println("Площадь прямоугольника: ${rectangle.getArea()}")
}
