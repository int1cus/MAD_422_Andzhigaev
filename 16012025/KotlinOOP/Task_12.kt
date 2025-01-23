/*
12. Интерфейс "Платежная система"
Создайте интерфейс PaymentSystem с методами pay() и refund().
Реализуйте классы CreditCard и PayPal, которые реализуют этот интерфейс.
*/

interface PaymentSystem {
    fun pay(amount: Double)
    fun refund(amount: Double)
}

class CreditCard : PaymentSystem {
    override fun pay(amount: Double) {
        println("Оплачено $$amount с использованием кредитной карты.")
    }

    override fun refund(amount: Double) {
        println("Возвращено $$amount на кредитную карту.")
    }
}

class PayPal : PaymentSystem {
    override fun pay(amount: Double) {
        println("Оплачено $$amount с использованием PayPal.")
    }

    override fun refund(amount: Double) {
        println("Возвращено $$amount на PayPal.")
    }
}

fun main() {
    val payment1: PaymentSystem = CreditCard()
    payment1.pay(100.0)
    payment1.refund(20.0)

    val payment2: PaymentSystem = PayPal()
    payment2.pay(200.0)
    payment2.refund(50.0)
}
