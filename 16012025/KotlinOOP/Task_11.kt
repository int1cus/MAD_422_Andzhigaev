/*
11. Класс "Магазин"
Реализуйте класс Product с полями name, price, и quantity.
Создайте класс Store, который содержит список продуктов и
методы для добавления, удаления и поиска товаров по имени.
*/

data class Product(val name: String, val price: Double, var quantity: Int)

class Store {
    private val products = mutableListOf<Product>()

    fun addProduct(product: Product) {
        products.add(product)
        println("Добавленный товар: $product")
    }

    fun removeProduct(name: String) {
        products.removeIf { it.name == name }
        println("Удаленный товар: $name")
    }

    fun findProduct(name: String): Product? {
        return products.find { it.name == name }
    }

    fun printProducts() {
        println("Товары в магазине:")
        products.forEach { println(it) }
    }
}

fun main() {
    val store = Store()
    store.addProduct(Product("Яблоко", 1.0, 100))
    store.addProduct(Product("Банан", 0.5, 200))
    store.addProduct(Product("Апельсин", 1.2, 150))
    store.printProducts()

    println("\nПоиск товара 'Яблоко':")
    println(store.findProduct("Яблоко"))

    store.removeProduct("Банан")
    store.printProducts()
}
