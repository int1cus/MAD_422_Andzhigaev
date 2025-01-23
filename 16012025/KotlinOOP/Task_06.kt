/*
6. Инкапсуляция: Банк
Создайте класс BankAccount с полями accountNumber, balance, и методами
для пополнения и снятия средств. Обеспечьте инкапсуляцию для безопасности данных счета.
*/

class BankAccount(private val accountNumber: String, private var balance: Double) {

    fun deposit(amount: Double) {
        if (amount > 0) balance += amount else println("Сумма пополнения должна быть положительной.")
    }

    fun withdraw(amount: Double) {
        if (amount > 0 && amount <= balance) balance -= amount else println("Недостаточно средств на балансе.")
    }

    fun getBalance(): Double {
        return balance
    }
}

fun main() {
    val account = BankAccount("12345678", 1000.0)

    account.deposit(500.0)
    println("Баланс после пополнения: ${account.getBalance()}")

    account.withdraw(300.0)
    println("Баланс после снятия: ${account.getBalance()}")

    account.withdraw(2000.0)
}
