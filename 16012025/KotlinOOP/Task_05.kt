/*
5. Класс "Книга" и "Библиотека"
Создайте класс Book с полями title, author, и year. Создайте класс Library,
который содержит коллекцию книг и методы для добавления книг, поиска по автору и году публикации.
*/

class Book(val title: String, val author: String, val year: Int) {
    fun printBookInfo() {
        println("Название: $title, Автор: $author, Год публикации: $year")
    }
}

class Library {
    private val books = mutableListOf<Book>()

    fun addBook(book: Book) {
        books.add(book)
        println("Книга добавлена: ${book.title}")
    }

    fun findBooksByAuthor(author: String): List<Book> {
        val foundBooks = books.filter { it.author.equals(author, ignoreCase = true) }
        if (foundBooks.isEmpty()) {
            println("Не найдено книг от автора: $author")
        }
        return foundBooks
    }

    fun findBooksByYear(year: Int): List<Book> {
        val foundBooks = books.filter { it.year == year }
        if (foundBooks.isEmpty()) {
            println("Не найдено книг за $year год")
        }
        return foundBooks
    }

    fun printAllBooks() {
        if (books.isEmpty()) {
            println("Библиотека пуста")
        } else {
            println("Книги в библиотеке:")
            books.forEach { it.printBookInfo() }
        }
    }
}


fun main() {
    val library = Library()

    val book1 = Book("1984", "Джордж Оруэлл", 1949)
    val book2 = Book("Убить пересмешника", "Харпер Ли", 1960)
    val book3 = Book("Скотный двор", "Джордж Оруэлл", 1945)

    library.addBook(book1)
    library.addBook(book2)
    library.addBook(book3)

    library.printAllBooks()

    println("\nКниги Джорджа Оруэлла:")
    val orwellBooks = library.findBooksByAuthor("Джордж Оруэлл")
    orwellBooks.forEach { it.printBookInfo() }

    println("\nКниги, опубликованные в 1945:")
    val books1945 = library.findBooksByYear(1945)
    books1945.forEach { it.printBookInfo() }

    println("\nКниги от скибиди туалета:")
    library.findBooksByAuthor("скибиди туалет")

    println("\nКниги, опубликованные в 3000 году:")
    library.findBooksByYear(3000)
}
